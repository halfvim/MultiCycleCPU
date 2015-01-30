`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:18:00 06/06/2011 
// Design Name: 
// Module Name:    statereg 
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
module statereg(
   input wire clk,
	input wire rst,
	input wire regwrite,
	input wire [3:0] datain,
	output reg [3:0] dataout
   );
	always @(posedge clk) begin
		if(rst)
			dataout<=0;
		else if(regwrite)
			dataout<=datain;
	end


endmodule
