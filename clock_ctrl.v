`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:16:58 06/06/2011 
// Design Name: 
// Module Name:    clock_ctrl 
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
module clock_ctrl(
   input wire clk,
	input wire rst,
	input wire [5:0] op,
	output wire [18:0] ctrl
   );
	wire [3:0] now,nxt;
	wire ma,lw,sw,r ,bq,j,ai,bn;
	wire [19:0] mw;
	wire [20:0] temp;
	
	statereg sr0(clk,rst,1'b1,nxt,now);
	
	and(ma, op[5],~op[4],       ~op[2], op[1], op[0]);//ma
	and(lw, op[5],~op[4],~op[3],~op[2], op[1], op[0]);//lw
	and(sw, op[5],~op[4], op[3],~op[2], op[1], op[0]);//sw
	and(r ,~op[5],~op[4],~op[3],~op[2],~op[1],~op[0]);//r
	and(bq,~op[5],~op[4],~op[3], op[2],~op[1],~op[0]);//beq
	and(bn,~op[5],~op[4],~op[3], op[2],~op[1], op[0]);//bne
	and(j ,~op[5],~op[4],~op[3],~op[2], op[1],~op[0]);//j
	and(ai,~op[5],~op[4], op[3],~op[2],~op[1],~op[0]);//addi
//state 0	
	and(mw[0],~now[3],~now[2],~now[1],~now[0]);
//state 1
	and(mw[1],~now[3],~now[2],~now[1],now[0]);//level1
	and(mw[2],~now[3],~now[2],~now[1],now[0],ma);//ma
	and(mw[3],~now[3],~now[2],~now[1],now[0],r );//r
	and(mw[4],~now[3],~now[2],~now[1],now[0],bq);//beq
	and(temp[0],~now[3],~now[2],~now[1],now[0],bn);//bne
	and(mw[5],~now[3],~now[2],~now[1],now[0],j );//j
	and(mw[6],~now[3],~now[2],~now[1],now[0],ai);//addi
//state 2
	and(mw[7],~now[3],~now[2], now[1],~now[0]);//level2
	and(mw[8],~now[3],~now[2], now[1],~now[0],lw);//lw
	and(mw[9],~now[3],~now[2], now[1],~now[0],sw);//sw
	and(mw[10],~now[3],~now[2],now[1],~now[0],ai);//addi
//final
	and(mw[11],~now[3],~now[2],now[1], now[0]);//3-lw
	and(mw[12],~now[3],now[2],~now[1],~now[0]);//4-lw-final
	and(mw[13],~now[3],now[2],~now[1], now[0]);//5-sw-final
	and(mw[14],~now[3],now[2], now[1],~now[0]);//6
	and(mw[15],~now[3],now[2], now[1], now[0]);//7
	and(mw[16],now[3],~now[2],~now[1],~now[0]);//8
	and(mw[17], now[3],~now[2],~now[1],now[0]);//9
	and(mw[18],now[3],~now[2], now[1],~now[0]);//10
	and(temp[1],now[3],~now[2],now[1], now[0]);//11
//next state
	or(nxt[3],mw[4],mw[5],mw[10],temp[0]);
	or(nxt[2],mw[3],mw[9],mw[11],mw[14]);
	or(nxt[1],mw[2],mw[3],mw[6],mw[8],mw[10],mw[14],temp[0]);
	or(nxt[0],mw[0],mw[5],mw[8],mw[9],mw[14],temp[0]);
//ctrl
	assign ctrl[18]=temp[1];             //selectzero
	assign ctrl[17]=mw[14];                //ALUop1
	assign ctrl[16]=mw[16];					//ALUop0
	or(ctrl[15],mw[7],mw[14],mw[16]);	//ALUsrcA
	or(ctrl[14],mw[1],mw[7]);				//ALUsrcB1
	or(ctrl[13],mw[0],mw[1]);				//ALUsrcB0
	assign ctrl[12]=mw[15];					//RegDst;
	assign ctrl[11]=mw[12];					//MemtoReg;
	or(ctrl[10],mw[12],mw[15],mw[18]);	//RegWrite;
	or(ctrl[9],mw[11],mw[13]);				//IorD;
	or(ctrl[8],mw[0],mw[11]);				//MemRead;
	assign ctrl[7] = mw[13];					//MemWrite;
	assign ctrl[6] = mw[0];						//IRwrite;
	assign ctrl[5] = mw[17];					//PCsource1;
	assign ctrl[4] = mw[16];					//PCsource0;
	assign ctrl[3] = mw[16];					//PCWriteCond;
	or(ctrl[2],mw[0],mw[17]);				//PCWrite;
	or(ctrl[1],mw[0],mw[7],mw[11],mw[14]);	//Seq1;
	or(ctrl[0],mw[0],mw[1],mw[11],mw[14]);	//Seq0;

endmodule
