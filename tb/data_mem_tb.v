`timescale 1ns/1ps

module data_mem_tb;

reg clk;
reg MemRead;
reg MemWrite;
reg [31:0] address;
reg [31:0] write_data;

wire [31:0] read_data;

data_mem uut (
    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .address(address),
    .write_data(write_data),
    .read_data(read_data)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    clk = 0;

    // Write 25 into memory[4]
    MemWrite = 1;
    MemRead  = 0;
    address = 4;
    write_data = 25;

    #10;

    // Read from memory[4]
    MemWrite = 0;
    MemRead  = 1;
    address = 4;

    #10;

    $finish;

end

endmodule