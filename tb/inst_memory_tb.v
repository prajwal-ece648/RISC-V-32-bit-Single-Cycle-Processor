`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 12:03:14
// Design Name: 
// Module Name: inst_memory_tb
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


module inst_memory_tb;

reg [31:0] addr;
wire [31:0] instruction;

inst_memory uut (
    .addr(addr),
    .instruction(instruction)
);

initial begin
    addr = 0;   #10;
    addr = 4;   #10;
    addr = 8;   #10;
    addr = 12;  #10;

    #20 $finish;
end

endmodule