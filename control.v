`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2023 11:48:01 AM
// Design Name: 
// Module Name: Controller.v
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


module Controller(
    opcode,
    functionCode,
    rt,
    RegWrite,
    ALUSrc,
    ALUControl,
    RegDst,
    MemWrite,
    MemRead,
    Branch,
    MemToReg,
    Zero,
    Jump
    );
    
    parameter RTYPE = 6'b000000;
    parameter ADD = 6'b100000;
    parameter SUB = 6'b100010;
    parameter MULT = 6'b011000;
    parameter AND = 6'b100100;
    parameter OR = 6'b100101;
    parameter NOR = 6'b100111;
    parameter XOR = 6'b100110;
    parameter SLL = 6'b000000;
    parameter SRL = 6'b000010;
    parameter SLT = 6'b101010;
    parameter JR = 6'b001000;
    
    parameter ADDI = 6'b001000;
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;
    parameter SB = 6'b101000;
    parameter SH = 6'b101001;
    parameter LB = 6'b100000;
    parameter LH = 6'b100001;
    parameter BGEZ_BLTZ = 6'b000001;
    parameter BEQ = 6'b000100;
    parameter BNE = 6'b000101;
    parameter BGTZ = 6'b000111;
    parameter BLEZ = 6'b000110;
    parameter J = 6'b000010;
    parameter JAL = 6'b000011;
    parameter ANDI = 6'b001100;
    parameter XORI = 6'b001110;
    parameter SLTI = 6'b001010;
    parameter ORI = 6'b001101;
    
    
    input wire [5:0] opcode;
    input wire [5:0] functionCode;
    input wire [4:0] rt;
    output reg [3:0] ALUControl;
    output reg [1:0] RegDst;
    output reg RegWrite;
    output reg ALUSrc;
    output reg [1:0] MemWrite;
    output reg [1:0] MemRead;
    output reg Branch;
    output reg [1:0] MemToReg;
    output reg Zero;
    output reg Jump;
    
    
    always @ (opcode, rt, functionCode) //added rt, functionCode bc error said should be on sensitivity list
    begin
            ALUSrc = 0;
            ALUControl = 4'b0000;
            RegDst = 0; //rd 
            Branch = 0;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 0;
            Jump = 0;
            Zero = 0;
        case(opcode)
        RTYPE:
        begin
            ALUSrc = 0;
            RegDst = 1; //rd 
            Branch = 0;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 1'b1;
            Jump = 0;
            Zero = 0;
            
            case(functionCode)
            ADD: ALUControl = 4'b0000;           
            SUB: ALUControl = 4'b0001;   
            MULT: ALUControl = 4'b0010;
            AND: ALUControl = 4'b1000;
            OR: ALUControl = 4'b1001;
            NOR: ALUControl = 4'b1010;
            XOR: ALUControl = 4'b1011;
            SLL: ALUControl = 4'b1100;
            SRL: ALUControl = 4'b1101;
            SLT: ALUControl = 4'b1110;
            JR:
                begin
                    ALUSrc = 0;
                    ALUControl = 4'b0000;
                    RegDst = 2'b10; //rd 
                    Branch = 0;
                    MemRead = 0;
                    MemToReg = 2'b10;
                    MemWrite = 0;
                    RegWrite = 1;            
                    Jump = 1;
                    Zero = 0;
                end       
                       
            endcase
        end
        ADDI:
        begin
            ALUSrc = 1;
            ALUControl = 4'b0000;
            RegDst = 0; //rt 
            Branch = 0;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 1;
            Jump = 0;
            Zero = 0;
        end
       
        
        LW:
        begin
            ALUSrc = 1;
            ALUControl = 4'b0000;
            RegDst = 0; //rt 
            Branch = 0;
            MemRead = 2'b11;
            MemToReg = 1;
            MemWrite = 2'b00;
            RegWrite = 1;
            Jump = 0;
            Zero = 0;
        end
        SW:
        begin
            ALUSrc = 1;
            ALUControl = 4'b0000;
            RegDst = 0; //don't care
            Branch = 0;
            MemRead = 2'b00;
            MemToReg = 0;
            MemWrite = 2'b11;
            RegWrite = 0;
            Jump = 0;
            Zero = 0;
        end        
        SB:
        begin
            ALUSrc = 1;
            ALUControl = 4'b0000;
            RegDst = 0; //rt 
            Branch = 0;
            MemRead = 2'b00;
            MemToReg = 0;
            MemWrite = 2'b01;
            RegWrite = 0;
            Jump = 0;
            Zero = 0;
        end        
        LH:
        begin
            ALUSrc = 1;
            ALUControl = 4'b0000;
            RegDst = 0; //rt 
            Branch = 0;
            MemRead = 2'b10;
            MemToReg = 1;
            MemWrite = 2'b00;
            RegWrite = 1;
            Jump = 0;
            Zero = 0;
        end    
        LB:
        begin
            ALUSrc = 1;
            ALUControl = 4'b0000;
            RegDst = 0; //rt 
            Branch = 0;
            MemRead = 2'b01;
            MemToReg = 1;
            MemWrite = 2'b00;
            RegWrite = 1;
            Jump = 0;
            Zero = 0;
        end
        SH:
        begin
            ALUSrc = 1;
            ALUControl = 4'b0000;
            RegDst = 0; //rt 
            Branch = 0;
            MemRead = 2'b00;
            MemToReg = 0;
            MemWrite = 2'b10;
            RegWrite = 0;
            Jump = 0;
            Zero = 0;
        end
        BGEZ_BLTZ:
        begin
                
                case(rt)
                
                4'b0001:
                begin
                ALUControl = 4'b0100;
                ALUSrc = 0;
                RegDst = 0; //don't care 
                Branch = 1;
                MemRead = 0;
                MemToReg = 0;
                MemWrite = 0;
                RegWrite = 0;
                Jump = 0;
                Zero = 0;
                end
                4'b0000: 
                begin
                ALUControl = 4'b0111;
                ALUSrc = 0;
                RegDst = 0; //don't care 
                Branch = 1;
                MemRead = 0;
                MemToReg = 0;
                MemWrite = 0;
                RegWrite = 0;
                Jump = 0;
                Zero = 0;
                end
                                
           
           
            endcase
        end
        BEQ:
        begin
            ALUSrc = 0;
            ALUControl = 4'b0001;
            RegDst = 0; // don't care
            Branch = 1;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 0;
            Jump = 0;
            Zero = 0;
        end
        BNE:
        begin
            ALUSrc = 0;
            ALUControl = 4'b0101;
            RegDst = 0; //don't care 
            Branch = 1;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 0;
            Jump = 0;
            Zero = 0;
        end         
        BGTZ:
        begin
            ALUSrc = 0;
            ALUControl = 4'b0011;
            RegDst = 0; // don't care 
            Branch = 1;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 0;
            Jump = 0;
            Zero = 0;
        end
        BLEZ:
        begin
            ALUSrc = 0;
            ALUControl = 4'b0110;
            RegDst = 0; // don't care 
            Branch = 1;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 0;
            Jump = 0;
            Zero = 0;
        end

        ///////////////////////// JUMPS?
        J:
        begin
            ALUSrc = 0;
            ALUControl = 4'b0000;
            RegDst = 0; //rd 
            Branch = 0;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 0;
            Jump = 1;
            Zero = 0;
        end
        
        JAL:
        begin
            ALUSrc = 0;
            ALUControl = 4'b0000;
            RegDst = 2'b10; //rd 
            Branch = 0;
            MemRead = 0;
            MemToReg = 2'b10;
            MemWrite = 0;
            RegWrite = 1;
            Jump = 1;
            Zero = 0;
        end
        /////////////////////////
        
        ANDI:
        begin
            ALUSrc = 1;
            ALUControl = 4'b1000;
            RegDst = 0; //rt 
            Branch = 0;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 1;
            Jump = 0;
            Zero = 0;
        end
      
       
        XORI:
        begin
            ALUSrc = 1;
            ALUControl = 4'b1011;
            RegDst = 0; //rt 
            Branch = 0;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 1;
            Jump = 0;
            Zero = 0;
        end
       
        SLTI:
        begin
            ALUSrc = 1;
            ALUControl = 4'b1110;
            RegDst = 0; //rt 
            Branch = 0;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 1;
            Jump = 0;
            Zero = 0;
        end    
        ORI:
        begin
            ALUSrc = 1;
            ALUControl = 4'b1001;
            RegDst = 0; //rt 
            Branch = 0;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 1;
            Jump = 0;
            Zero = 0;
        end
        default:
        begin
            ALUSrc = 0;
            ALUControl = 04'b0000;
            RegDst = 0; //rt 
            Branch = 0;
            MemRead = 0;
            MemToReg = 0;
            MemWrite = 0;
            RegWrite = 0;
            Jump = 0;
            Zero = 0;
        end
           
    
    endcase
    end
endmodule
