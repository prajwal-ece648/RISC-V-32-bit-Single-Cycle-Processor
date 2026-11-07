`timescale 1ns / 1ps

module control_unit(
    input  [6:0] opcode,
    input  [2:0] funct3,
    input  [6:0] funct7,

    output reg       alu_src,
    output reg       reg_write,
    output reg       mem_read,
    output reg       mem_write,
    output reg       mem_to_reg,
    output reg       branch,
    output reg       branch_ne,
    output reg       jal,
    output reg [3:0] alu_control
);

always @(*) begin

    // Default values
    alu_src     = 1'b0;
    reg_write   = 1'b0;
    mem_read    = 1'b0;
    mem_write   = 1'b0;
    mem_to_reg  = 1'b0;
    branch      = 1'b0;
    branch_ne   = 1'b0;
    jal         = 1'b0;
    alu_control = 4'b0010;

    case (opcode)

        // -------------------------
        // R-type
        // -------------------------
        7'b0110011: begin

            reg_write = 1'b1;
            alu_src   = 1'b0;

            case ({funct7, funct3})

                10'b0000000000: alu_control = 4'b0010; // ADD
                10'b0100000000: alu_control = 4'b0110; // SUB
                10'b0000000111: alu_control = 4'b0000; // AND
                10'b0000000110: alu_control = 4'b0001; // OR
                10'b0000000100: alu_control = 4'b0011; // XOR
                10'b0000000010: alu_control = 4'b0111; // SLT

                default:
                    alu_control = 4'b0010;

            endcase
        end

        // -------------------------
        // ADDI
        // -------------------------
        7'b0010011: begin

            alu_src     = 1'b1;
            reg_write   = 1'b1;
            alu_control = 4'b0010;

        end

        // -------------------------
        // LW
        // -------------------------
        7'b0000011: begin

            alu_src     = 1'b1;
            reg_write   = 1'b1;
            mem_read    = 1'b1;
            mem_to_reg  = 1'b1;
            alu_control = 4'b0010;

        end

        // -------------------------
        // SW
        // -------------------------
        7'b0100011: begin

            alu_src     = 1'b1;
            mem_write   = 1'b1;
            alu_control = 4'b0010;

        end

        // -------------------------
        // BEQ / BNE
        // -------------------------
        7'b1100011: begin

            alu_src     = 1'b0;
            alu_control = 4'b0110;

            // BEQ
            if (funct3 == 3'b000)
                branch = 1'b1;

            // BNE
            else if (funct3 == 3'b001)
                branch_ne = 1'b1;

        end

        // -------------------------
        // JAL
        // -------------------------
        7'b1101111: begin

            jal       = 1'b1;
            reg_write = 1'b1;

        end

        // -------------------------
        // Default
        // -------------------------
        default: begin

            alu_src     = 1'b0;
            reg_write   = 1'b0;
            mem_read    = 1'b0;
            mem_write   = 1'b0;
            mem_to_reg  = 1'b0;
            branch      = 1'b0;
            branch_ne   = 1'b0;
            jal         = 1'b0;
            alu_control = 4'b0010;

        end

    endcase

end

endmodule