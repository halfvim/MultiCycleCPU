`timescale 1ns / 1ps

module debug(
				input wire [31:0]buffer,
				input wire[1:0]mode,
				 input wire[31:0]disp_data,
				 output reg[15:0]disp_num);
	wire [15:0]display_num;
	always @*
	begin
		case(mode[1:0])
			2'b00: disp_num = disp_data[15:0];
			2'b01: disp_num = disp_data[31:16];
			2'b10: disp_num = display_num;
			2'b11: disp_num = buffer[15:0];
		endcase
	end
	ascii_decoder ascii_decoder0(buffer,display_num);
endmodule
