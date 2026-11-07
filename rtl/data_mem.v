`timescale 1ns / 1ps

module data_memory (
    input clk,
    input mem_write,
    input mem_read,
    input [31:0] address,
    input [31:0] write_data,
    output [31:0] read_data
);

    reg [31:0] memory [0:255];

    integer i;

    initial begin
        for (i = 0; i < 256; i = i + 1)
            memory[i] = 32'd0;
    end

    // Write to memory
    always @(posedge clk) begin
        if (mem_write)
            memory[address[9:2]] <= write_data;
    end

    // Read from memory
    assign read_data = mem_read ?
                       memory[address[9:2]] :
                       32'd0;

endmodule