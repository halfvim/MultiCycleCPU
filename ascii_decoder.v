`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:00 05/18/2011 
// Design Name: 
// Module Name:    ascii_decoder 
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
module ascii_decoder(
	input [31:0]buffer,
	output reg [15:0]display_num
	);
	
	
	always @* begin
		case(buffer[7:0])
			8'h30: display_num[3:0]<=4'h0;
			8'h31: display_num[3:0]<=4'h1;
			8'h32: display_num[3:0]<=4'h2;
			8'h33: display_num[3:0]<=4'h3;
			8'h34: display_num[3:0]<=4'h4;
			8'h35: display_num[3:0]<=4'h5;
			8'h36: display_num[3:0]<=4'h6;
			8'h37: display_num[3:0]<=4'h7;
			8'h38: display_num[3:0]<=4'h8;
			8'h39: display_num[3:0]<=4'h9;
			8'h41: display_num[3:0]<=4'ha;
			8'h42: display_num[3:0]<=4'hb;
			8'h43: display_num[3:0]<=4'hc;
			8'h44: display_num[3:0]<=4'hd;
			8'h45: display_num[3:0]<=4'he;
			8'h46: display_num[3:0]<=4'hf;
		endcase
	end
	
	always @* begin
		case(buffer[15:8])
			8'h30: display_num[7:4]<=4'h0;
			8'h31: display_num[7:4]<=4'h1;
			8'h32: display_num[7:4]<=4'h2;
			8'h33: display_num[7:4]<=4'h3;
			8'h34: display_num[7:4]<=4'h4;
			8'h35: display_num[7:4]<=4'h5;
			8'h36: display_num[7:4]<=4'h6;
			8'h37: display_num[7:4]<=4'h7;
			8'h38: display_num[7:4]<=4'h8;
			8'h39: display_num[7:4]<=4'h9;
			8'h41: display_num[7:4]<=4'ha;
			8'h42: display_num[7:4]<=4'hb;
			8'h43: display_num[7:4]<=4'hc;
			8'h44: display_num[7:4]<=4'hd;
			8'h45: display_num[7:4]<=4'he;
			8'h46: display_num[7:4]<=4'hf;
		endcase
	end
	
	always @* begin
		case(buffer[23:16])
			8'h30: display_num[11:8]<=4'h0;
			8'h31: display_num[11:8]<=4'h1;
			8'h32: display_num[11:8]<=4'h2;
			8'h33: display_num[11:8]<=4'h3;
			8'h34: display_num[11:8]<=4'h4;
			8'h35: display_num[11:8]<=4'h5;
			8'h36: display_num[11:8]<=4'h6;
			8'h37: display_num[11:8]<=4'h7;
			8'h38: display_num[11:8]<=4'h8;
			8'h39: display_num[11:8]<=4'h9;
			8'h41: display_num[11:8]<=4'ha;
			8'h42: display_num[11:8]<=4'hb;
			8'h43: display_num[11:8]<=4'hc;
			8'h44: display_num[11:8]<=4'hd;
			8'h45: display_num[11:8]<=4'he;
			8'h46: display_num[11:8]<=4'hf;
		endcase
	end
	
	always @* begin
		case(buffer[31:24])
			8'h30: display_num[15:12]<=4'h0;
			8'h31: display_num[15:12]<=4'h1;
			8'h32: display_num[15:12]<=4'h2;
			8'h33: display_num[15:12]<=4'h3;
			8'h34: display_num[15:12]<=4'h4;
			8'h35: display_num[15:12]<=4'h5;
			8'h36: display_num[15:12]<=4'h6;
			8'h37: display_num[15:12]<=4'h7;
			8'h38: display_num[15:12]<=4'h8;
			8'h39: display_num[15:12]<=4'h9;
			8'h41: display_num[15:12]<=4'ha;
			8'h42: display_num[15:12]<=4'hb;
			8'h43: display_num[15:12]<=4'hc;
			8'h44: display_num[15:12]<=4'hd;
			8'h45: display_num[15:12]<=4'he;
			8'h46: display_num[15:12]<=4'hf;
		endcase
	end
	

endmodule
