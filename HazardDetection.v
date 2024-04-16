`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2023 01:52:16 PM
// Design Name: 
// Module Name: HazardDetection
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module HazardDetection(IDEX_MemRead, EXMEM_MemRead, IDEX_rt, IFID_Instruction, hold_PC, hold_IFID);

    input IDEX_MemRead, EXMEM_MemRead;
    input[4:0] IDEX_rt;
    input [31:0] IFID_Instruction;
    output reg hold_PC, hold_IFID;
    reg [5:0] opcode;
    //opcode <= IFID_Instruction[31:26];
    
    parameter BGEZ_BLTZ = 6'b000001;
    parameter BEQ = 6'b000100;
    parameter BNE = 6'b000101;
    parameter BGTZ = 6'b000111;
    parameter BLEZ = 6'b000110;
    
    initial
        begin
        hold_PC <= 0;
        hold_IFID <= 0;
        end
    
    always@(IDEX_MemRead || IDEX_rt || IFID_Instruction)
        begin
            if(IDEX_MemRead && (hold_PC == 1'b0) && (hold_IFID == 1'b0)) // RAW (STALL)
                begin
                    if(IDEX_rt == IFID_Instruction[25:11] || IDEX_rt == IFID_Instruction[20:15])
                        begin
                            hold_PC <= 1;
                            hold_IFID <= 1;
                        end
                 end
            else if((IFID_Instruction[31:26] == BEQ) || (IFID_Instruction[31:26] == BGEZ_BLTZ) || (IFID_Instruction[31:26] == BNE) || (IFID_Instruction[31:26] == BGTZ) || (IFID_Instruction[31:26] == BLEZ)) // BRANCHES (FLUSH)
                begin
                    hold_PC <= 1;
                    hold_IFID <= 1;
                end
            else
                begin
                    hold_PC <= 0;
                    hold_IFID <= 0;
                end
         end

    
endmodule
