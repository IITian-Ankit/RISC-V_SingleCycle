//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2025 09:21:49 PM
// Design Name: 
// Module Name: Single_Cycle_Top
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

//Inclusion of the files we want in the top module. *Only file name to be used not module name*
`include "Program_Counter.v"
`include "Instruction_Memory.v"
`include "Register_files.v"
`include "Sign_Extend.v"
`include "ALU.v"
`include "Control_Unit.v"
`include "Data_Memory.v"
`include "PC_Adder.v"
`include "Mux.v"



module Single_Cycle_Top(clk,rst); //only clk and rst because we need clk to synchronise every model and rst to reset everything
    //Input and Output 
    input clk,rst;
    
    wire [31:0] PC_Top; //As we know the output of P_C is connected to the i/p (A) of instruction memory, we will assign a wire for the connection.
    wire [31:0] RD_Instr; //As output of RD from instruction memory is connected to register file, control unt,extend
    wire [31:0] RD1_Top; //As output RD1 is connected to input 'A' of ALU
    wire [31:0] Imm_Ext_Top; //As output from Extend goes to input 'B' of ALU
    wire [2:0] ALUControl_Top; //As alucontrol wire comes out of output of control unit and serves as input in the ALU 
    wire [31:0] ALUResult; //Result of ALU is further connected to the data memory's input
    wire [31:0] ReadData; //As the read data is then connected to WD3 of the register file
    wire [31:0] PCPlus4; //As the output of PC_Adder is again served as the input of the program counter
    wire [31:0] RD2_Top; // AS RD2 output goes in WD of data memory
    wire RegWrite; //As regwrite output of the control unit is connected to the WE3 of the register file.
    wire [1:0] ImmSrc; //As ImmSrc is served as input to sign extend to decide whether to do I type or S type instruction.
    wire MemWrite; //As MemWrite is served as input to data memory's WE.
    wire ALUSrc; //As output ALUSrc is served as select of the mux
    wire [31:0] SrcB; //As output of the mux is connected to the input B of the ALU
    wire ResultSrc; //As output ResultSrc is connected as select line to mux alongside data memory.
    wire [31:0] Result; //As output of mux from data memory is connected to WD3 of register file
   
    //Module instantiation
    P_C PC(
       .clk(clk),
       .rst(rst),
       .PC(PC_Top),
       .PC_NEXT(PCPlus4)
       );
       
    Instr_Mem Instruction_Mmeory(
            .rst(rst),
            .A(PC_Top),
            .RD(RD_Instr)
          );
     
    Reg_file Register_File(
             .clk(clk),
             .rst(rst),
             .WE3(RegWrite),
             .A1(RD_Instr[19:15]), //As only [19:15] bits of RD intrusction are served as input to A1
             .A2(RD_Instr[24:20]),
             .A3(RD_Instr[11:7]),
             .WD3(Result),
             .RD1(RD1_Top),
             .RD2(RD2_Top)
         );
    
   Sign_Extend Sign_Extend(
                       .In(RD_Instr),
                       .ImmSrc(ImmSrc[0]),
                       .Imm_Ext(Imm_Ext_Top)
          );
          
   alu ALU(
         .A(RD1_Top),
         .B(SrcB),
         .ALUControl(ALUControl_Top),
         .Result(ALUResult),
         .Z(),
         .N(),
         .V(),
         .C()
   );
   
   Control_Unit_Top Control_Unit_Top(
           .op(RD_Instr[6:0]),
           .RegWrite(RegWrite),
           .zero(),
           .ImmSrc(ImmSrc),
           .ALUSrc(ALUSrc),
           .MemWrite(MemWrite),
           .ResultSrc(ResultSrc),
           .funct3(RD_Instr[14:12]),
           .funct7(),
           .PCSrc(),
           .ALUControl(ALUControl_Top)
   );
   
   Data_Memory Data_Memory(
           .A(ALUResult),
           .WE(MemWrite),
           .clk(clk),
           .WD(RD2_Top),
           .RD(ReadData)
   );
   
   PC_Adder PC_Adder(
           .a(PC_Top),
           .b(32'd4),
           .c(PCPlus4)
   );

   Mux Mux_Reg_2_Alu(
        .a(RD2_Top),
        .b(Imm_Ext_Top),
        .s(ALUSrc),
        .c(SrcB)
   );
   Mux DataMem_2_Reg(
        .a(ALUResult),
        .b(ReadData),
        .s(ResultSrc),
        .c(Result)
   );
endmodule