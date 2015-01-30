`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:31:13 06/09/2011
// Design Name:   memory
// Module Name:   F:/workspace/verilog/multi_c/test_memory.v
// Project Name:  multi_c
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_memory;

	// Inputs
	reg clka;
	reg [31:0] dina;
	reg [10:0] addra;
	reg wea;
	reg clkb;
	reg [31:0] dinb;
	reg [10:0] addrb;
	reg web;

	// Outputs
	wire [31:0] douta;
	wire [31:0] doutb;

	// Instantiate the Unit Under Test (UUT)
	memory uut (
		.clka(clka), 
		.dina(dina), 
		.addra(addra), 
		.wea(wea), 
		.douta(douta), 
		.clkb(clkb), 
		.dinb(dinb), 
		.addrb(addrb), 
		.web(web), 
		.doutb(doutb)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		dina = 0;
		addra = 0;
		wea = 0;
		clkb = 0;
		dinb = 0;
		addrb = 0;
		web = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

