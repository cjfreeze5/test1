`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - MEM_WB.v
// Description - MEM/WB stores control signals needed by the WB stage, ALU output and the Data memory output along with the destination register.
////////////////////////////////////////////////////////////////////////////////
module MEM_WB(Clk, MemToReg, RegWrite, ALUResult, ReadData, R_destination,
			 MemToReg_out, RegWrite_out, ALUResult_out, ReadData_out, R_destination_out);

	//input [1:0] MemToReg;
	input [31:0] ALUResult, ReadData; //output of Datamem
	input [4:0] R_destination; 
	input Clk, MemToReg, RegWrite;
	
	//reg [1:0] MemToReg_save;
	reg [31:0] ALUResult_save, ReadData_save;
	reg [4:0] R_destination_save; 
	reg MemToReg_save, RegWrite_save;
	
    //output reg [1:0] MemToReg_out;
	output reg [31:0] ALUResult_out, ReadData_out;
	output reg [4:0] R_destination_out;
	output reg MemToReg_out, RegWrite_out;
	
	
	initial begin 
        MemToReg_save = 1'b0;
		RegWrite_save = 1'b0;
		ALUResult_save = 32'b0;
		ReadData_save = 32'b0;
		R_destination_save = 5'b0;
		
		MemToReg_out = 1'b0;
		RegWrite_out = 1'b0;
		ALUResult_out = 32'b0;
		ReadData_out = 32'b0;
		R_destination_out = 5'b0;
		
	end 
	
	
	always@(posedge Clk) begin
		MemToReg_save <= MemToReg;
		RegWrite_save <= RegWrite;
		
		ALUResult_save <= ALUResult;
		ReadData_save <= ReadData;
		
		R_destination_save <= R_destination;
	end
	
	always@(*)begin
		MemToReg_out <= MemToReg_save;
		RegWrite_out <= RegWrite_save;
		
		ALUResult_out <= ALUResult_save;
		ReadData_out <= ReadData_save;
		
		R_destination_out <= R_destination_save;
	end

endmodule