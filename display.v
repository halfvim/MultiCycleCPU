`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:32 03/09/2011 
// Design Name: 
// Module Name:    display 
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
module display
(
input wire clk, reset,
input wire [31:0] disp_num,
output reg [3:0] an,
output reg [7:0] sseg
);
	localparam N = 18;
	reg [N-1:0] q_reg;
	wire [N-1:0] q_next;
	reg [7:0] hex_in;
	
	always @(posedge clk, posedge reset)
	if (reset)
	q_reg <= 0;
	else
	q_reg <= q_next;
	assign q_next = q_reg + 1;
	always @*
	case (q_reg[N-1:N-2])
	2'b00:
	begin
	an = 4'b1110;
	hex_in = disp_num[7:0];
	end
	2'b01:
	begin
	an = 4'b1101;
	hex_in = disp_num[15:8];
	end
	2'b10:
	begin
	an = 4'b1011;
	hex_in = disp_num[23:16];
	end
	default:
	begin
	an = 4'b0111;
	hex_in = disp_num[31:24];
	end
	endcase
	always @*
	begin
	case(hex_in)
	8'h0:  sseg =8'b11111111;
	8'h30: sseg =8'b11000000;
	8'h31: sseg =8'b11111001;
	8'h32: sseg =8'b10100100;
	8'h33: sseg =8'b10110000;
	8'h34: sseg =8'b10011001;
	8'h35: sseg =8'b10010010;
	8'h36: sseg =8'b10000010;
	8'h37: sseg =8'b11111000;
	8'h38: sseg =8'b10000000;
	8'h39: sseg =8'b10010000;
	8'h41: sseg =8'b10001000;
	8'h42: sseg =8'b10000011;
	8'h43: sseg =8'b11000110;
	8'h44: sseg =8'b10100001;
	8'h45: sseg =8'b10000110;
	8'h46: sseg =8'b10001110;
	8'h47: sseg =8'b11000010;
	8'h4F: sseg =8'b10100011;
	default:  sseg =8'b01111111;      
	endcase
	end
endmodule

module display2(input wire clk,reset,
input wire [15:0] disp_num, 
input wire [3:0] dp_in,
output reg [3:0] an, 
output reg [7:0] sseg );
	localparam  N = 18; 
	reg [N-1:0] q_reg; 
	wire [N-1:0] q_next;
	reg [3:0] hex_in;
	reg dp;
	always @(posedge clk, posedge reset)
	if (reset)
		q_reg <= 0;
	else
		q_reg <= q_next;
	assign q_next = q_reg + 1; 
	always @*
	case (q_reg[N-1:N-2])
		2'b00:
	begin
		an = 4'b1110;
		hex_in = disp_num[3:0];
		dp = dp_in[0];
	end
	2'b01:
	begin
		an = 4'b1101;
		hex_in = disp_num[7:4];
		dp = dp_in[1];
	end
	2'b10:
	begin
		an = 4'b1011;
		hex_in = disp_num[11:8];
		dp = dp_in[2];
	end
	default:
	begin
		an = 4'b0111;
		hex_in = disp_num[15:12];
		dp = dp_in[3];
	end
	endcase
	always @*
	begin
	case(hex_in)
		4'h0: sseg[6:0] = 7'b1000000;
		4'h1: sseg[6:0] = 7'b1111001;
		4'h2: sseg[6:0] = 7'b0100100;
		4'h3: sseg[6:0] = 7'b0110000;
		4'h4: sseg[6:0] = 7'b0011001;
		4'h5: sseg[6:0] = 7'b0010010;
		4'h6: sseg[6:0] = 7'b0000010;
		4'h7: sseg[6:0] = 7'b1111000;
		4'h8: sseg[6:0] = 7'b0000000;
		4'h9: sseg[6:0] = 7'b0010000;
		4'ha: sseg[6:0] = 7'b0001000;
		4'hb: sseg[6:0] = 7'b0000011;
		4'hc: sseg[6:0] = 7'b1000110;
		4'hd: sseg[6:0] = 7'b0100001;
		4'he: sseg[6:0] = 7'b0000110;
		default: sseg[6:0] = 7'b0001110;
	endcase
	sseg[7] = dp;
	end
endmodule
