`timescale 1ns/1ps

module imm_gen_tb;

reg [31:0] instruction;
wire [31:0] imm_out;

imm_gen uut (
    .instruction(instruction),
    .imm_out(imm_out)
);

initial begin

    // I-type immediate = 5
    instruction = 32'b00000000010100000000000010010011;
    #10;

    // S-type immediate = 8
    instruction = 32'b00000000000100010010010000100011;
    #10;

    $finish;

end

endmodule