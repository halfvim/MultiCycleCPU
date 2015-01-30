`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:00:21 06/06/2011 
// Design Name: 
// Module Name:    register 
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
module register(
   input wire clk, 
	input wire rst, 
	input wire regwrite,
	input wire [31:0] datain,
	output reg [31:0] dataout
	);
	always @(posedge clk) begin
		if(rst)dataout<=0;
		else if(regwrite)dataout<=datain;
	end
endmodule
