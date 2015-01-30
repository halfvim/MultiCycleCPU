`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/03/2011 
// Design Name: 
// Module Name:    aluc 
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
module aluc(
   input wire [1:0] aluop,
	input wire [5:0] func,
	output reg[2:0] ctl
	);
	always@ *
	begin
		case(aluop)
		2'b00:ctl = 3'b010;//add
		2'b01:ctl = 3'b110;//sub
		2'b10:
		begin
			case(func)
				6'b100000:ctl = 3'b010;//add
				6'b100010:ctl = 3'b110;//sub
				6'b100100:ctl = 3'b000;//and
				6'b100101:ctl = 3'b001;//or
				6'b101010:ctl = 3'b111;//slt
				6'b000000:ctl = 3'b011;//sll
				6'b000010:ctl = 3'b100;//srl
				6'b100110:ctl = 3'b101;//Xor
			endcase
		end
		endcase
	end
endmodule
