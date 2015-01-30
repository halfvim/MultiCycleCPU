`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:15:23 06/06/2011 
// Design Name: 
// Module Name:    clock_pc 
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
module clock_pc(
   input wire clk,
	input wire rst,
	input wire we,
	input wire [10:0] in,
	output reg [10:0] out
	);
	always @(posedge clk) begin
		if(rst)out<=0;
		else if(we)out<=in;
	end


endmodule
