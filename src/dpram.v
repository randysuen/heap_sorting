`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:04 01/09/2018 
// Design Name: 
// Module Name:    dpram_l 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dpram
#(
parameter DATA_WIDTH = 32,
parameter ADDR_WIDTH = 5,
parameter LEVEL = 1
)
(
	input clk,
//port a
	input [DATA_WIDTH-1:0] data_a,
	input we_a,
	input [ADDR_WIDTH-1:0] addr_a,
	output reg [DATA_WIDTH-1:0] q_a,
//port b	
	input [DATA_WIDTH-1:0] data_b,
	input we_b,
	input [ADDR_WIDTH-1:0] addr_b,
	output reg [DATA_WIDTH-1:0] q_b
 );
(* ram_style = "block" *)
	localparam MEM_SIZE = 1<<LEVEL;
	reg [DATA_WIDTH-1:0] ram[MEM_SIZE-1:0];  //body of the RAM	
generate
	if (MEM_SIZE==1) begin
		reg [DATA_WIDTH-1:0] ram;
		always@(posedge clk) begin
			if (we_a) begin
				q_a <= data_a;
				q_b <= data_a;
				ram <= data_a;
			end
			else if (we_b) begin
				q_a <= data_b;
				q_b <= data_b;
				ram <= data_b;
			end
			else begin
				q_a <= ram;
				q_b <= ram;
			end
		end
	end
	else begin	
		always@(posedge clk) begin		
			if (we_a) begin
				ram[addr_a] <= data_a;
			end
				q_a <= ram[addr_a];
		end
		always@(posedge clk) begin
			if (we_b) begin
				ram[addr_b] <= data_b;
			end
			q_b <= ram[addr_b];
		end
	end
endgenerate

endmodule
