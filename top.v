`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:25:10 06/03/2011 
// Design Name: 
// Module Name:    top 
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
module top(disp_clk,clk_in,rst_in,switch,led,anode,segment
    );
	 input wire disp_clk,clk_in,rst_in;
	 input wire [7:0] switch;
	 output wire [7:0] led;
	 output wire [3:0] anode;
	 output wire [7:0] segment;
	 
	 wire clk,rst,zero,PCWriteCond,PCWrite,IorD,MemRead,MemWrite,MemtoReg,IRWrite,RegDst,RegWrite,ALUSrcA;
	 wire and_out,or_out,selectzero,zeroout;
	 wire [1:0] PCSource,ALUSrcB,ALUop,seq;
	 wire [2:0] aluc;
	 wire [31:0] IR,Wdat,RdatA,RdatB,RinA,RinB,Result,ALUout,MDR,testResult,inst,Rdat1,Rdat2,extendout,pcout;
	 wire [10:0] Addr,next_pc;
	 wire [4:0] Wreg,test;
	 wire [18:0] ctrl;
	 wire [15:0] disp_num;
	 wire [31:0]buffer;
	 assign selectzero = ctrl[18];
	 assign ALUop = ctrl[17:16];
	 assign ALUSrcA = ctrl[15];
	 assign ALUSrcB = ctrl[14:13];
	 assign RegDst = ctrl[12];
	 assign MemtoReg = ctrl[11];
	 assign RegWrite = ctrl[10];
	 assign IorD = ctrl[9];
	 assign MemRead = ctrl[8];
	 assign MemWrite = ctrl[7];
	 assign IRWrite = ctrl[6];
	 assign PCSource = ctrl[5:4];
	 assign PCWriteCond = ctrl[3];
	 assign PCWrite = ctrl[2];
	 assign seq = ctrl[1:0];
	 

	 //control signal
	 clock_ctrl x_clock_ctrl(clk,rst,IR[31:26],ctrl); 
	 //display

	 display x_display(disp_clk, 0, buffer, anode, segment);
//	 display2 x_display(disp_clk, 0, disp_num,4'b1111, anode, segment);
	 //pc
	 clock_mux_2 #(1) M0(zero,~zero,selectzero,zeroout);
	 //pc control signal
	 and(and_out,zeroout,PCWriteCond);
	 or(or_out,and_out,PCWrite);
	 //四选一pcout
	 clock_mux_4 M1(pcout,PCSource,Result,ALUout,{6'b000000,IR[25:0]},32'h00000000);
	 //获取下一条pc
	 clock_pc x_clock_pc(clk,rst,or_out,pcout[10:0],next_pc);
	 
	 //指?钍??娲⑵?	 
	 memory x_memory(.addra(Addr),.addrb(11'b11111111111),.clka(disp_clk),.clkb(disp_clk),
							.dina(RdatB),.dinb(32'h0),.douta(inst),.doutb(buffer),.wea(MemWrite),.web(1'b0));
	 
	 register x_IR(clk,rst,IRWrite,inst,IR);
	 register x_MDR(clk,rst,1'b1,inst,MDR);
	 register x_A(clk,rst,1'b1,Rdat1,RdatA);
	 register x_B(clk,rst,1'b1,Rdat2,RdatB);
	 register x_ALUout(clk,rst,1'b1,Result,ALUout);
	 extend x_extend(IR[15:0],extendout);
	 //二选一Wreg
	 clock_mux_2 #(5) M2(IR[20:16],IR[15:11],RegDst,Wreg);
	 //二选一addr
	 clock_mux_2 #(11) M6(next_pc,ALUout[10:0],IorD,Addr);
	 //二选一Wdat
	 clock_mux_2 #(32) M3(ALUout,MDR,MemtoReg,Wdat);
	 //二选一RinA
	 clock_mux_2 #(32) M4({{21'b000000000000000000000},next_pc},RdatA,ALUSrcA,RinA);
	 //四选一RinB
	 clock_mux_4 M5(RinB,ALUSrcB,RdatB,32'h00000001,extendout,extendout);
	 //寄存器组
	 regs x_regs(clk,rst,IR[25:21],IR[20:16],test,Wreg,Wdat,RegWrite,Rdat1,Rdat2,testResult);
	 //ALUctrl
	 aluc x_aluc(ALUop,IR[5:0],aluc);
	 //ALU运算
	 alu x_alu(RinA,RinB,aluc,IR[10:6],zero,Result);
	 
	 pbdebounce p0(disp_clk,clk_in,clk);
	 pbdebounce p1(disp_clk,rst_in,rst); 
	 
//	 debug x_debug(buffer,switch[7:6],testResult,disp_num);
	 
	 assign led[5:0]=IR[31:26];
	 assign test[4:0]=switch[4:0];
endmodule
