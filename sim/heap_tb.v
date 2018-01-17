`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:07:51 01/16/2018
// Design Name:   heap
// Module Name:   D:/mediasoc_project/803 FPGA 2017_10/fpga803/board_image/sim/heap_tb.v
// Project Name:  image
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: heap
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "D:/mediasoc_project/803 FPGA 2017_10/fpga803/board_image/include/define.v"
module heap_tb;

	// Inputs
	reg clk;
	reg rstn;
	reg [`DATA_WIDTH-1:0] din;
	reg en;
	reg init;
	reg flush;
	reg waiting;
	// Outputs
	wire [`DATA_WIDTH-1:0] dout;
	wire valid;

	// Instantiate the Unit Under Test (UUT)
	heap#(.DATA_WIDTH(`DATA_WIDTH),.KEY_WIDTH(`KEY_WIDTH),.NLEVELS(`NLEVELS)) uut (
		.clk(clk), 
		.rstn(rstn), 
		.din(din), 
		.en(en), 
		.init(init),
		.flush(flush),
		.dout(dout), 
		.valid(valid)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rstn = 0;
		din = 0;
		en = 0;
		init = 0;
		waiting = 1;
		flush = 0;
		// Wait 100 ns for global reset to finish
		#100;
      rstn = 1;
		
		// Add stimulus here
		#40;
		init = 1;
		#15;
		init = 0;
		
		#1000;
		waiting = 0;
		#1000;
		waiting = 1;
		flush = 1;
		#15;
		flush = 0;
		#1000;
		$stop;
	end
	

always#7 clk = ~clk;

always@(posedge clk or negedge rstn) begin
	if (!rstn) begin
		din <= 0;//({$random}%256)<<`VAL_WIDTH;
		en <= 0;
	end
	else if (!waiting) begin
		en <= ~en;
		if (en)
			din <= ({$random}%256);
	end
end
		
wire [`KEY_WIDTH-1:0] din_key;
wire [`KEY_WIDTH-1:0] dout_key;

assign din_key = din[`KEY_WIDTH-1:0];
assign dout_key = dout[`KEY_WIDTH-1:0];

   
endmodule

