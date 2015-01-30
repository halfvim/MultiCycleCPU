`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:25:15 06/03/2011 
// Design Name: 
// Module Name:    clock_mux_4 
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
module clock_mux_4(S, Ctrl, A, B, C, D);
	parameter N=32;
	input wire[N-1:0] A, B, C, D;
	input wire [1:0] Ctrl;
	output reg [N-1:0] S;
	
	always @* begin
	  case (Ctrl)
	    2'b00: S=A;
		 2'b01: S=B;
		 2'b10: S=C;
		 2'b11: S=D;
	  endcase
	end
endmodule
