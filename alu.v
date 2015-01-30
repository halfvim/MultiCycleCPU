`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:17 06/03/2011 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input wire [31:0] i_r,
    input wire [31:0] i_s,
    input wire [2:0] switch,
	 input wire [4:0] shamt,
    output wire o_zf,
    output reg [31:0] disp_code);
    always @*
        case(switch[2:0])
        3'b000: disp_code=i_r[31:0]&i_s[31:0];
        3'b001: disp_code=i_r[31:0]|i_s[31:0];
        3'b010: disp_code=i_r[31:0]+i_s[31:0];
        3'b110: disp_code=i_r[31:0]-i_s[31:0];
        3'b111: disp_code=i_r[31:0]<i_s[31:0]?1:0;
		  //
		  3'b011: disp_code=i_s[31:0]<<shamt;
		  3'b100: disp_code=i_s[31:0]>>shamt;
		  3'b101: disp_code=i_s[31:0]^i_r[31:0];
        endcase
	assign o_zf = (disp_code=={32{1'b0}})? 1'b1: 1'b0;


endmodule
