`timescale 1ns / 1ps
module p_c_tb;

reg clk;
reg reset;
reg [31:0] pc_in;
wire [31:0] pc_out;

p_c uut (
    .clk(clk),
    .reset(reset),
    .pc_in(pc_in),
    .pc_out(pc_out)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    pc_in = 32'd0;

    #10;
    reset = 0;

    pc_in = 32'd4;
    #10;

    pc_in = 32'd8;
    #10;

    pc_in = 32'd12;
    #10;

    pc_in = 32'd16;
    #10;

    $finish;
end

endmodule