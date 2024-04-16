`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - EX_MEM.v
// Description - EX/MEM stores the control signal needed by the subsequent stages (note that execution stage control signals
//				have already been used to control the MUXes in the EX stage.) the branch target address (output of adder), ALU
//				output, zero flag, and destination register (output of 2:1 mux controlled by RegDst).
////////////////////////////////////////////////////////////////////////////////
module EX_MEM(Clk, MemToReg, RegWrite, MemWrite, MemRead, Branch, Zero, Jump, RegData2, ALUResult, AdderResult, R_destination,
			MemToReg_out, RegWrite_out, MemWrite_out, MemRead_out, Branch_out, Zero_out, Jump_out, RegData2_out, 
			ALUResult_out, AdderResult_out, R_destination_out);

	input [1:0] MemWrite, MemRead;
	input Clk, MemToReg, RegWrite, Branch, Zero, Jump;
	input [31:0] RegData2, ALUResult, AdderResult; //branch target address
	input [4:0] R_destination; //output of 2:1 mux controlled by RegDst: Rt or Rd
	
	reg [1:0] MemWrite_save, MemRead_save;
	reg MemToReg_save, RegWrite_save, Branch_save, Zero_save, Jump_save;
	reg [31:0] RegData2_save, ALUResult_save, AdderResult_save; 
	reg [4:0] R_destination_save;
	
	output reg [1:0] MemWrite_out, MemRead_out;
	output reg MemToReg_out, RegWrite_out, Branch_out, Zero_out, Jump_out;
	output reg [31:0] RegData2_out, ALUResult_out, AdderResult_out; 
	output reg [4:0] R_destination_out;
	
	initial begin 
        MemToReg_save = 1'b0;
		RegWrite_save = 1'b0;
		MemWrite_save = 2'b0;
		MemRead_save = 2'b0;
		Branch_save = 1'b0;
		Zero_save = 1'b0;
		Jump_save = 1'b0;
		RegData2_save = 32'b0;
		ALUResult_save = 32'b0;
		AdderResult_save = 32'b0;
		R_destination_save = 5'b0;
		
		MemToReg_out = 1'b0;
		RegWrite_out = 1'b0;
		MemWrite_out = 2'b0;
		MemRead_out = 2'b0;
		Branch_out = 1'b0;
		Zero_out = 1'b0;
		Jump_out = 1'b0;
		RegData2_out = 32'b0;
		ALUResult_out = 32'b0;
		AdderResult_out = 32'b0;
		R_destination_out = 5'b0;
		
    end
	
	
	always@(posedge Clk)begin
		MemToReg_save <= MemToReg;
		RegWrite_save <= RegWrite;
		MemWrite_save <= MemWrite;
		MemRead_save <= MemRead;
		Branch_save <= Branch;
		Zero_save <= Zero;
		Jump_save <= Jump;
		
		RegData2_save <= RegData2;
		ALUResult_save <= ALUResult;
		AdderResult_save <= AdderResult;
		
		R_destination_save <= R_destination;
	end
	
	always@(*)begin
		MemToReg_out <= MemToReg_save;
		RegWrite_out <= RegWrite_save;
		MemWrite_out <= MemWrite_save;
		MemRead_out <= MemRead_save;
		Branch_out <= Branch_save;
		Zero_out <= Zero_save;
		Jump_out <= Jump_save;
		
		RegData2_out <= RegData2_save;
		ALUResult_out <= ALUResult_save;
		AdderResult_out <= AdderResult_save;
		
		R_destination_out <= R_destination_save;
		
	end

endmodule