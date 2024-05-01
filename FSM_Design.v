// Code your design here
// Code your design here
module memory_module (
    input wire clk,
    input wire enable,
    input wire rb_w,
  	input wire [2:0] address,
  	input wire [7:0] data_in,
  	output reg [7:0] data_out
);


  reg [7:0] memory_array [7:0];

//always @(posedge clk) begin
  //if (rb_w && enable) begin
        // Write operation
    //    memory_array[address] <= data_in;
    //end 
  //else (rb_w!)begin
        // Read operation
    //    data_out = memory_array[address];
    //end
//end

//endmodule

always@(posedge clk) begin
  if (enable) begin
    if (rb_w) begin
      memory_array[address] <= data_in;
    end
    else begin
      data_out <= memory_array[address];
    end
  end
  else begin
  end
end
endmodule