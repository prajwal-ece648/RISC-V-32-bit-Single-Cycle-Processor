`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2026 20:16:34
// Design Name: 
// Module Name: regfile_tb
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


module regfile_tb;

reg clk;
reg we;
reg [4:0] rs1, rs2, rd;
reg [31:0] wd;
wire [31:0] rd1, rd2;

regfile uut (
    .clk(clk),
    .we(we),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(wd),
    .rd1(rd1),
    .rd2(rd2)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    we = 0;
    rs1 = 0;
    rs2 = 0;
    rd  = 0;
    wd  = 0;

    // Write 10 to x1
    #10 we = 1; rd = 1; wd = 32'd10;

    // Write 20 to x2
    #10 rd = 2; wd = 32'd20;

    // Read x1 and x2
    #10 we = 0; rs1 = 1; rs2 = 2;

    #20 $finish;
end

endmodule