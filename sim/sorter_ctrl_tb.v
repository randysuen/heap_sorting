`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:16:59 01/12/2018
// Design Name:   sorter_ctrl
// Module Name:   D:/mediasoc_project/803 FPGA 2017_10/fpga803/board_image/sim/sorter_ctrl_tb.v
// Project Name:  image
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sorter_ctrl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sorter_ctrl_tb;

	// Inputs
	reg tm_din;
	reg lm_din;
	reg rm_din;
	reg up_in;
	reg up_in_val;
	reg up_in_addr;
	reg low_in;
	reg low_in_val;
	reg low_in_addr;
	reg clk;
	reg clk_en;
	reg ready_in;
	reg rst_n;

	// Outputs
	wire tm_dout;
	wire tm_addr;
	wire tm_we;
	wire lm_dout;
	wire lm_addr;
	wire lm_we;
	wire rm_dout;
	wire rm_addr;
	wire rm_we;
	wire up_out;
	wire up_out_val;
	wire up_out_addr;
	wire low_out;
	wire low_out_val;
	wire low_out_addr;
	wire ready_out;

	// Instantiate the Unit Under Test (UUT)
	sorter_ctrl uut (
		.tm_din(tm_din), 
		.tm_dout(tm_dout), 
		.tm_addr(tm_addr), 
		.tm_we(tm_we), 
		.lm_din(lm_din), 
		.lm_dout(lm_dout), 
		.lm_addr(lm_addr), 
		.lm_we(lm_we), 
		.rm_din(rm_din), 
		.rm_dout(rm_dout), 
		.rm_addr(rm_addr), 
		.rm_we(rm_we), 
		.up_in(up_in), 
		.up_in_val(up_in_val), 
		.up_in_addr(up_in_addr), 
		.up_out(up_out), 
		.up_out_val(up_out_val), 
		.up_out_addr(up_out_addr), 
		.low_out(low_out), 
		.low_out_val(low_out_val), 
		.low_out_addr(low_out_addr), 
		.low_in(low_in), 
		.low_in_val(low_in_val), 
		.low_in_addr(low_in_addr), 
		.clk(clk), 
		.clk_en(clk_en), 
		.ready_in(ready_in), 
		.ready_out(ready_out), 
		.rst_n(rst_n)
	);

	initial begin
		// Initialize Inputs
		tm_din = 0;
		lm_din = 0;
		rm_din = 0;
		up_in = 0;
		up_in_val = 0;
		up_in_addr = 0;
		low_in = 0;
		low_in_val = 0;
		low_in_addr = 0;
		clk = 0;
		clk_en = 0;
		ready_in = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

