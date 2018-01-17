`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:20:46 01/12/2018
// Design Name:   sort_node
// Module Name:   D:/mediasoc_project/803 FPGA 2017_10/fpga803/board_image/sim/sort_node_tb.v
// Project Name:  image
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sort_node
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sort_node_tb;
	
	parameter DATA_WIDTH = 32;
	parameter ADDR_WIDTH = 1;
	// Inputs
	reg clk;
	reg rstn;
	reg init;
	reg [DATA_WIDTH-1:0] um_in;
	wire [DATA_WIDTH-1:0] lm_in;
	wire [DATA_WIDTH-1:0] rm_in;
	reg pl_update_in;
	reg [ADDR_WIDTH-1:0] pl_addr_in;
	reg pl_branch_in;
	reg [DATA_WIDTH-1:0] pl_in;
	reg nl_update_in;
	reg [DATA_WIDTH-1:0] nl_in;
	reg [ADDR_WIDTH-1:0] nl_addr_in;
	reg nl_branch_in;

	// Outputs
	wire [DATA_WIDTH-1:0] um_out;
	wire [ADDR_WIDTH-1:0] um_addr;
	wire um_we;
	wire [DATA_WIDTH-1:0] lm_out;
	wire [ADDR_WIDTH-1:0] lm_addr;
	wire lm_we;
	wire [DATA_WIDTH-1:0] rm_out;
	wire [ADDR_WIDTH-1:0] rm_addr;
	wire rm_we;
	wire [DATA_WIDTH-1:0] pl_out;
	wire pl_update_out;
	wire pl_branch_out;
	wire [DATA_WIDTH-1:0] nl_out;
	wire nl_update_out;
	wire [ADDR_WIDTH-1:0] nl_addr_out;
	wire nl_branch_out;
	// Instantiate the Unit Under Test (UUT)
	sort_node #(.DATA_WIDTH(DATA_WIDTH),.ADDR_WIDTH(ADDR_WIDTH)) U_SN
	(
		.clk(clk), 
		.rstn(rstn), 
		.init(init), 
		.um_in(um_in), 
		.um_out(um_out), 
		.um_addr(um_addr), 
		.um_we(um_we), 
		.lm_in(lm_in), 
		.lm_out(lm_out), 
		.lm_addr(lm_addr), 
		.lm_we(lm_we), 
		.rm_in(rm_in), 
		.rm_out(rm_out), 
		.rm_addr(rm_addr), 
		.rm_we(rm_we), 
		.pl_update_in(pl_update_in), 
		.pl_addr_in(pl_addr_in), 
		.pl_branch_in(pl_branch_in), 
		.pl_in(pl_in), 
		.pl_out(pl_out), 
		.pl_update_out(pl_update_out), 
		.pl_branch_out(pl_branch_out), 
		.nl_update_in(nl_update_in), 
		.nl_in(nl_in), 
		.nl_addr_in(nl_addr_in), 
		.nl_branch_in(nl_branch_in), 
		.nl_out(nl_out), 
		.nl_update_out(nl_update_out), 
		.nl_addr_out(nl_addr_out),
		.nl_branch_out(nl_branch_out)
	);

	data_store #(.DATA_WIDTH(DATA_WIDTH),.ADDR_WIDTH(ADDR_WIDTH)) U_DS 
	(
		.clk(clk), 
		.lm_din(lm_out), 
		.lm_addr(lm_addr), 
		.lm_we(lm_we), 
		.lm_dout(lm_in), 
		.rm_din(rm_out), 
		.rm_addr(rm_addr), 
		.rm_we(rm_we), 
		.rm_dout(rm_in), 
		.nl_din(), 
		.nl_addr(), 
		.nl_we(), 
		.nl_branch(), 
		.nl_dout()
	);

reg init_done;
	initial begin
		// Initialize Inputs
		clk = 0;
		rstn = 0;
		init = 0;
		um_in = 0;
//		lm_in = 0;
//		rm_in = 0;
		pl_update_in = 0;
		pl_addr_in = 0;
		pl_branch_in = 0;
		pl_in = 0;
		nl_update_in = 0;
		nl_in = 0;
		nl_addr_in = 0;
		nl_branch_in = 0;
		init_done = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rstn = 1; 
		// Add stimulus here
	
		init = 1;
		#20;
		init = 0;
		init_done = 1;
		#800;
	$stop;	
	end
	
	always#10 clk = ~clk;
	
	always@(posedge clk) begin
		if (init_done) begin
			pl_update_in <= ~pl_update_in;
			if (~pl_update_in)
				pl_in <= ({$random}%256)<<14;
		end
	end
				
	
      
endmodule

