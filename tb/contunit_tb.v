`timescale 1ns/1ps

module contunit_tb;

reg [6:0] opcode;

wire RegWrite;
wire ALUSrc;
wire MemRead;
wire MemWrite;
wire MemtoReg;

contunit uut (
    .opcode(opcode),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .MemtoReg(MemtoReg)
);

initial begin

    // R-type
    opcode = 7'b0110011;
    #10;

    // Load
    opcode = 7'b0000011;
    #10;

    // Store
    opcode = 7'b0100011;
    #10;

    // Immediate
    opcode = 7'b0010011;
    #10;

    $finish;
end

endmodule