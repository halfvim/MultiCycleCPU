`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:38:12 06/04/2011 
// Design Name: 
// Module Name:    fetch 
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
module fetch(inst_mdr,IRWrite,IR
    );
	 input wire [31:0] inst_mdr;
	 input wire IRWrite;
	 output reg [31:0] IR;
	 
	 always @*
	 if(IRWrite==1'b1)
	    assign IR[31:0]=inst_mdr;


endmodule
