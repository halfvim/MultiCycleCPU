`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:09:20 06/03/2011 
// Design Name: 
// Module Name:    clock_mux_2 
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
//N-1¶àÂ·Ñ¡ÔñÆ÷
module clock_mux_2(A, B, Ctrl, S);
	parameter N=32;
	input wire[N-1:0] A, B;
	input wire Ctrl;
	output wire[N-1:0] S;
	assign S = (Ctrl == 1'b0) ? A : B;
endmodule
