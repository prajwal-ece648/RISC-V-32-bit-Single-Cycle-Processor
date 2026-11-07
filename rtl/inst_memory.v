`timescale 1ns / 1ps

module inst_memory (
    input  [31:0] addr,
    output [31:0] instruction
);

    reg [31:0] memory [0:255];

    integer i;

    initial begin

        // Clear memory
        for (i = 0; i < 256; i = i + 1)
            memory[i] = 32'h00000000;

        // -------------------------
        // ADDI
        // -------------------------
        memory[0] = 32'h00500093;  // ADDI x1, x0, 5
        memory[1] = 32'h00A00113;  // ADDI x2, x0, 10

        // -------------------------
        // R-type
        // -------------------------
        memory[2] = 32'h002081B3;  // ADD x3, x1, x2
        memory[3] = 32'h40208233;  // SUB x4, x1, x2
        memory[4] = 32'h0020F2B3;  // AND x5, x1, x2
        memory[5] = 32'h0020E333;  // OR  x6, x1, x2
        memory[6] = 32'h0020C3B3;  // XOR x7, x1, x2
        memory[7] = 32'h0020A433;  // SLT x8, x1, x2

        // -------------------------
        // SW / LW
        // -------------------------
        memory[8] = 32'h00302023;  // SW x3, 0(x0)
        memory[9] = 32'h00002203;  // LW x4, 0(x0)

        // -------------------------
        // BEQ
        // From PC = 40 to PC = 48
        // Offset = +8
        // -------------------------
        memory[10] = 32'h00208463; // BEQ x1, x2, +8

        // -------------------------
        // BNE
        // From PC = 44 to PC = 52
        // Offset = +8
        // -------------------------
        memory[11] = 32'h00209263; // BNE x1, x2, +4

        // -------------------------
        // JAL
        // -------------------------
        memory[12] = 32'h008000EF; // JAL x1, +8

    end

    // Instruction fetch
    assign instruction = memory[addr[9:2]];

endmodule