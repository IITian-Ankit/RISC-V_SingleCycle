module alu(A,B,ALUControl,Result,Z,N,V,C);
// declaring inputs
   input [31:0] A,B;
   input [2:0] ALUControl;

// declaring outputs
   output [31:0] Result;
   output Z,N,V,C ;

// declaring interim wires
   wire [31:0] a_and_b; //stores answer of a and b
   wire [31:0] a_or_b; //stores answer of a or b
   wire [31:0] not_b; // stores not of b
   
   wire [31:0] mux_1;

   wire [31:0] sum;

   wire [31:0] mux_2;

   wire [31:0] slt;
   wire cout;
// Logic design
  // AND Operation
  assign a_and_b = A & B;
  // OR Operation
  assign a_or_b = A | B;
  // NOT Operation on B
  assign not_b = ~B;

  //Ternary Operator for MUX 1
  assign mux_1 = (ALUControl[0] == 1'b0) ? B : not_b; //if ALUContro is '0' the we will give output of mux as 'B' or else 'not_b'. The term "1'b0" represents whether the contro signal is of 1 bit and it is zero.

  // Addition and Subtraction Operation
   assign {cout,sum} = A + mux_1 + ALUControl[0];

  // Zero Extension
  assign slt = {31'b0000000000000000000000000000000,sum[31]};

  // Designing 4X1 Mux
  assign mux_2 = (ALUControl[2:0] == 3'b000) ? sum : 
                 (ALUControl[2:0] == 3'b001) ? sum :
                 (ALUControl[2:0] == 3'b010) ? a_and_b :
                 (ALUControl[2:0] == 3'b011) ? a_or_b :
                 (ALUControl[2:0] == 3'b101) ? slt : 32'h00000000;
                 
  assign Result = mux_2;

  // Assignment of Flags
  assign Z = &(~Result); //Zero Flag 

  assign N = Result[31]; // Negative Flag

  assign C = cout & (~ALUControl[1]); // Carry Flag

  assign V = (~ALUControl[1]) & (A[31] ^ sum[31]) & (~(A[31] ^ B[31] ^ ALUControl[0]));
endmodule 