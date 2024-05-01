// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
module testbench;
reg clk;
reg enable;
reg rb_w;
reg [2:0] address;
reg [7:0] data_in;

wire [7:0] data_out;

// UUT
memory_module uut (
    .clk(clk),
    .enable(enable),
  	.rb_w(rb_w),
    .address(address),
    .data_in(data_in),
    .data_out(data_out)
);

initial begin
    /// Initialize
  $dumpfile("dump.vcd"); $dumpvars;
    clk = 1;
    enable = 0;
  	rb_w = 0;
    address = 0;
    data_in = 0;

    #10;
  	enable = 0;
  	rb_w = 1;
    address = 3'b100;
    data_in = 8'hAB;
  
  	#10;
  	
        
    /// Write to loc 0 - clock 1
    enable = 1;
  	rb_w = 1;
    address = 3'b111;
    
    
    #10;
    
    // Read from loc 0 - clock 2
    enable = 1;
  	rb_w = 0;
    address = 3'b111;
    #10;
    
    
    $finish;
end

always #5 clk = ~clk;

endmodule