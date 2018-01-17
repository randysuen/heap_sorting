`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:18:53 01/12/2018
// Design Name:   data_store
// Module Name:   D:/mediasoc_project/803 FPGA 2017_10/fpga803/board_image/sim/data_store_tb.v
// Project Name:  image
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_store
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module data_store_tb;

	// Inputs
	reg clk;
	reg [31:0] lm_din;
	reg [4:0] lm_addr;
	reg lm_we;
	reg [31:0] rm_din;
	reg [4:0] rm_addr;
	reg rm_we;
	reg [31:0] nl_din;
	reg [4:0] nl_addr;
	reg nl_we;
	reg nl_branch;

	// Outputs
	wire [31:0] lm_dout;
	wire [31:0] rm_dout;
	wire [31:0] nl_dout;

	// Instantiate the Unit Under Test (UUT)
	data_store uut (
		.clk(clk), 
		.lm_din(lm_din), 
		.lm_addr(lm_addr), 
		.lm_we(lm_we), 
		.lm_dout(lm_dout), 
		.rm_din(rm_din), 
		.rm_addr(rm_addr), 
		.rm_we(rm_we), 
		.rm_dout(rm_dout), 
		.nl_din(nl_din), 
		.nl_addr(nl_addr), 
		.nl_we(nl_we), 
		.nl_branch(nl_branch), 
		.nl_dout(nl_dout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		lm_din = 0;
		lm_addr = 0;
		lm_we = 0;
		rm_din = 0;
		rm_addr = 0;
		rm_we = 0;
		nl_din = 0;
		nl_addr = 0;
		nl_we = 0;
		nl_branch = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

