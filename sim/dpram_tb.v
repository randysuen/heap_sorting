`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:17:58 01/12/2018
// Design Name:   dpram
// Module Name:   D:/mediasoc_project/803 FPGA 2017_10/fpga803/board_image/sim/dpram_tb.v
// Project Name:  image
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dpram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dpram_tb;

	// Inputs
	reg clk;
	reg [16-1:0] data_a;
	reg we_a;
	reg [5-1:0] addr_a;
	reg [16-1:0] data_b;
	reg we_b;
	reg [5-1:0] addr_b;

	// Outputs
	wire [16-1:0] q_a;
	wire [16-1:0] q_b;

	// Instantiate the Unit Under Test (UUT)
	dpram #(.DATA_WIDTH(16), .ADDR_WIDTH(5)) uut(
		.clk(clk), 
		.data_a(data_a), 
		.we_a(we_a), 
		.addr_a(addr_a), 
		.q_a(q_a), 
		.data_b(data_b), 
		.we_b(we_b), 
		.addr_b(addr_b), 
		.q_b(q_b)
	);

	initial begin
		clk = 0;
		forever #7 clk = ~clk;
	end
	
	initial begin
		// Initialize Inputs
		data_a = 0;
		we_a = 0;
		addr_a = 0;
		data_b = 0;
		we_b = 0;
		addr_b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		data_a = 8'h55;
		addr_a = 5'h1f;
		
		data_b = 8'h66;
		addr_b = 5'h1e;
		
		we_a = 1'b1;
		we_b = 1'b1;
		
		#100;
		addr_a = 5'h1e;
		addr_b = 5'h1f;
		
		we_a = 1'b0;
		we_b = 1'b0;
		
		#100;
		data_a = 8'h42;
		addr_a = 5'h0A;
		
		data_b = 8'h38;
		addr_b = 5'h15;
		
		we_a = 1'b1;
		we_b = 1'b1;
		
		#100;
		addr_a = 5'h15;
		addr_b = 5'h0A;
		
		we_a = 1'b0;
		we_b = 1'b0;
		
		#200;
		$stop;
	end
      
		
	
endmodule

