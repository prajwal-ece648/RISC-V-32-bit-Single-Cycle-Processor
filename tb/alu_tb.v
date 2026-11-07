`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2026 23:35:42
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module alu_tb;

reg [31:0] a, b;
reg [2:0] alu_sel;
wire [31:0] result;

alu uut (
    .a(a),
    .b(b),
    .alu_sel(alu_sel),
    .result(result)
);

initial begin
    // ADD
    a = 10; b = 5; alu_sel = 3'b000;
    #10;

    // SUB
    alu_sel = 3'b001;
    #10;

    // AND
    alu_sel = 3'b010;
    #10;

    // OR
    alu_sel = 3'b011;
    #10;

    $finish;
end

endmodule