`timescale 1ns / 1ps

module regfile(
    input clk,
    input we,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] wd,
    output [31:0] rd1,
    output [31:0] rd2
);

reg [31:0] regfile [0:31];

integer i;

initial begin
    for (i = 0; i < 32; i = i + 1)
        regfile[i] = 32'd0;
end

// Read operation
assign rd1 = (rs1 == 5'd0) ? 32'd0 : regfile[rs1];
assign rd2 = (rs2 == 5'd0) ? 32'd0 : regfile[rs2];

// Write operation
always @(posedge clk) begin
    if (we && (rd != 5'd0))
        regfile[rd] <= wd;
end

endmodule