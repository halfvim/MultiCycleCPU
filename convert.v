`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:42:18 05/10/2011 
// Design Name: 
// Module Name:    convert 
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
module convert(
input wire [3:0] in,
output reg [3:0] hi,
output reg [3:0] lo);

always @(*) begin
	case (in)
	0:begin hi = 4'b0011; lo = 4'b0000; end
	1:begin hi = 4'b0011; lo = 4'b0001; end
	2:begin hi = 4'b0011; lo = 4'b0010; end
	3:begin hi = 4'b0011; lo = 4'b0011; end
	4:begin hi = 4'b0011; lo = 4'b0100; end
	5:begin hi = 4'b0011; lo = 4'b0101; end
	6:begin hi = 4'b0011; lo = 4'b0110; end
	7:begin hi = 4'b0011; lo = 4'b0111; end
	8:begin hi = 4'b0011; lo = 4'b1000; end
	9:begin hi = 4'b0011; lo = 4'b1001; end
  10:begin hi = 4'b0100; lo = 4'b0001; end
  11:begin hi = 4'b0100; lo = 4'b0010; end
  12:begin hi = 4'b0100; lo = 4'b0011; end
  13:begin hi = 4'b0100; lo = 4'b0100; end
  14:begin hi = 4'b0100; lo = 4'b0101; end
  15:begin hi = 4'b0100; lo = 4'b0110; end
  endcase
end
endmodule
