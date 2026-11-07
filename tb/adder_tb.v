`timescale 1ns / 1ps

module adder_tb;

reg [31:0] a;
reg [31:0] b;
wire [31:0] sum;

adder uut (
    .a(a),
    .b(b),
    .sum(sum)
);

initial begin

    // Test 1
    a = 32'd4;
    b = 32'd4;
    #10;

    // Test 2
    a = 32'd10;
    b = 32'd20;
    #10;

    // Test 3
    a = 32'd100;
    b = 32'd50;
    #10;

    $finish;

end

endmodule