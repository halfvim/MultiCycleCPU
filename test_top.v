`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:15:52 06/09/2011
// Design Name:   top_test
// Module Name:   F:/workspace/verilog/multi_c/test_top.v
// Project Name:  multi_c
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_top;

	// Inputs
	reg disp_clk;
	reg clk_in;
	reg rst_in;
	reg [7:0] switch;

	// Outputs
	wire [31:0] buffer;
	wire [31:0] IR;
	wire [18:0] ctrl;
	wire [10:0] PC;

	// Instantiate the Unit Under Test (UUT)
	top_test uut (
		.disp_clk(disp_clk), 
		.clk_in(clk_in), 
		.rst_in(rst_in), 
		.switch(switch), 
		.buffer(buffer), 
		.IR(IR), 
		.ctrl(ctrl), 
		.PC(PC)
	);

	initial begin
		// Initialize Inputs
		disp_clk = 0;
		clk_in = 0;
		rst_in = 0;
		switch = 8'h80;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #20
	begin
		disp_clk = ~disp_clk;
		clk_in = ~clk_in;
	end
      
endmodule

