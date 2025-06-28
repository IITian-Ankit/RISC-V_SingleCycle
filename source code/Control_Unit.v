`include "alu_decoder.v"
`include "decoder.v"

module Control_Unit_Top(op,RegWrite,zero,ImmSrc,ALUSrc,MemWrite,ResultSrc,funct3,funct7,PCSrc,ALUControl);

    input [6:0]op,funct7;
    input [2:0]funct3;
    input zero;
    output RegWrite,ALUSrc,MemWrite,ResultSrc,PCSrc;
    output [1:0]ImmSrc;
    output [2:0]ALUControl;

    wire [1:0]ALUOp;

    main_decoder Main_Decoder(
                .op(op),
                .Regwrite(RegWrite),
                .ImmSrc(ImmSrc),
                .Memwrite(MemWrite),
                .ResultSrc(ResultSrc),
                .zero(zero),
                .PCSrc(PCSrc),
                .ALUSrc(ALUSrc),
                .ALUOp(ALUOp)
    );

    alu_decoder ALU_Decoder(
                            .ALUOp(ALUOp),
                            .funct3(funct3),
                            .funct7(funct7),
                            .op(op),
                            .ALUControl(ALUControl)
    );

endmodule