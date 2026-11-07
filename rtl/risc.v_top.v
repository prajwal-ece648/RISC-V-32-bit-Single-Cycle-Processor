`timescale 1ns / 1ps

module riscv_top(
    input clk,
    input reset,

    output [31:0] pc_debug,
    output [31:0] instruction_debug,
    output [31:0] alu_result_debug,
    output [31:0] memory_read_debug
);

    // -------------------------
    // Wires
    // -------------------------
    wire [31:0] pc_current;
    wire [31:0] pc_next;
    wire [31:0] pc_plus_4;

    wire [31:0] instruction;
    wire [31:0] immediate;

    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] rd;

    wire [31:0] rd1;
    wire [31:0] rd2;

    wire [31:0] alu_input_b;
    wire [31:0] alu_result;

    wire [31:0] memory_read_data;
    wire [31:0] write_back_data;

    wire reg_write;
    wire alu_src;
    wire mem_write;
    wire mem_read;
    wire mem_to_reg;

    // Branch signals
    wire branch;
    wire branch_ne;
    wire zero;

    // JAL
    wire jal;

    wire [31:0] branch_target;
    wire [31:0] jal_target;


    wire [3:0] alu_control;


    // -------------------------
    // Instruction fields
    // -------------------------
    assign rs1 = instruction[19:15];
    assign rs2 = instruction[24:20];
    assign rd  = instruction[11:7];


    // -------------------------
    // Program Counter
    // -------------------------
    p_c PC (
        .clk(clk),
        .reset(reset),
        .pc_in(pc_next),
        .pc_out(pc_current)
    );


    // -------------------------
    // PC + 4
    // -------------------------
    adder ADDER (
        .a(pc_current),
        .b(32'd4),
        .sum(pc_plus_4)
    );


    // -------------------------
    // Instruction Memory
    // -------------------------
    inst_memory IMEM (
        .addr(pc_current),
        .instruction(instruction)
    );


    // -------------------------
    // Immediate Generator
    // -------------------------
    imm_gen IMM_GEN (
        .instruction(instruction),
        .imm_out(immediate)
    );


    // -------------------------
    // Control Unit
    // -------------------------
    control_unit CONTROL_UNIT (
        .opcode(instruction[6:0]),
        .funct3(instruction[14:12]),
        .funct7(instruction[31:25]),

        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .mem_to_reg(mem_to_reg),

        .branch(branch),
        .branch_ne(branch_ne),
        .jal(jal),

        .alu_control(alu_control)
    );


    // -------------------------
    // Register File
    // -------------------------
    regfile REGFILE (
        .clk(clk),
        .we(reg_write),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wd(write_back_data),
        .rd1(rd1),
        .rd2(rd2)
    );


    // -------------------------
    // ALU input selection
    // -------------------------
    assign alu_input_b = (alu_src) ?
                         immediate :
                         rd2;


    // -------------------------
    // ALU
    // -------------------------
    alu ALU (
        .a(rd1),
        .b(alu_input_b),
        .alu_sel(alu_control),
        .result(alu_result)
    );


    // -------------------------
    // Zero detection
    // -------------------------
    assign zero = (alu_result == 32'd0);


    // -------------------------
    // BEQ/BNE target
    // -------------------------
    assign branch_target = pc_current + immediate;


    // -------------------------
    // JAL target
    // -------------------------
    assign jal_target = pc_current + immediate;


    // -------------------------
    // Next PC
    // -------------------------
    assign pc_next = jal ?
                     jal_target :
                     ((branch && zero) ||
                      (branch_ne && !zero)) ?
                     branch_target :
                     pc_plus_4;


    // -------------------------
    // Data Memory
    // -------------------------
    data_memory DATA_MEMORY (
        .clk(clk),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .address(alu_result),
        .write_data(rd2),
        .read_data(memory_read_data)
    );


    // -------------------------
    // Write-back
    // JAL writes PC + 4 to rd
    // -------------------------
    assign write_back_data = jal ?
                             pc_plus_4 :
                             ((mem_to_reg) ?
                              memory_read_data :
                              alu_result);
assign pc_debug = pc_current;
assign instruction_debug = instruction;
assign alu_result_debug  = alu_result;
assign memory_read_debug = memory_read_data;

endmodule