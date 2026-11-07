`timescale 1ns / 1ps

module riscv_top_tb;

    // Clock and reset
    reg clk;
    reg reset;

wire [31:0] pc_debug;
wire [31:0] instruction_debug;
wire [31:0] alu_result_debug;
wire [31:0] memory_read_debug;

riscv_top uut (
    .clk(clk),
    .reset(reset),
    .pc_debug(pc_debug),
    .instruction_debug(instruction_debug),
    .alu_result_debug(alu_result_debug),
    .memory_read_debug(memory_read_debug)
);

    // Clock generation
    initial begin
        clk = 1'b0;

        forever #5 clk = ~clk;
    end

    // Reset
    initial begin
        reset = 1'b1;

        #10;

        reset = 1'b0;

        #150;

        $finish;
    end

endmodule