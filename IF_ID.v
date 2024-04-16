//Size of the register file depends on the number of bits transferred from one stage to another. 
//In this design each stage takes 1 clock cycle, meaning a single instruction will go through 5 phases and take 5 clock cycles to complete. 
//You will still be reading an instruction in each clock cycle. 
//Other than the registers introduced between 5 stages, the entire datapath is exactly same as the single cycle datapath.

`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - IF_ID.v
// Description - IF/ID register is storing the 32-bit PC value and the 32-bit instruction read from the instruction memory.
////////////////////////////////////////////////////////////////////////////////
module IF_ID(Clk, Instruction, PCAddResult, Instruction_out, PCAddResult_out, hold, flush);

	input Clk;
	input hold, flush;
	input [31:0] Instruction, PCAddResult;
	
	reg [31:0] Instruction_save, PCAddResult_save;
	
	output reg [31:0] Instruction_out, PCAddResult_out;

    initial begin 
        Instruction_save = 32'b0;
        PCAddResult_save = 32'b0;
        Instruction_out = 32'b0;
        PCAddResult_out = 32'b0;
    end 
    
	always@(posedge Clk)begin
		Instruction_save <= Instruction;
		PCAddResult_save <= PCAddResult;
		
	end
	
	always@(*)begin
		PCAddResult_out <= PCAddResult_save;
		if (hold == 0) begin Instruction_out <= Instruction_save; end
		else if (flush == 1) begin Instruction_out <= 32'b0; end 
	end
	
endmodule
