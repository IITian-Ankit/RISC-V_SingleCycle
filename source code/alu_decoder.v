//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2025 10:14:16 PM
// Design Name: 
// Module Name: alu_decoder
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


module alu_decoder(ALUOp,op,funct3,funct7,ALUControl);

  //Input/Output declaration
  input[6:0] op,funct7;
  input [1:0] ALUOp;
  input [2:0] funct3;
  output [2:0] ALUControl;
  
  //Assigning a wire to [op5,funct7], as their values as a pair effect the output
  wire [1:0] link;
   //Assigning every output and wires with their respective functions and outputs
   assign link  = {op[5],funct7[5]};
   
   assign ALUControl = (ALUOp == 2'b00) ? 3'b000 :
                       (ALUOp == 2'b01) ? 3'b001 :
                       ((ALUOp == 2'b10) & (funct3 == 3'b000) & (link == 2'b11)) ? 3'b001 :
                       ((ALUOp == 2'b10) & (funct3 == 3'b000) & (link != 2'b11)) ? 3'b000 :
                       ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 3'b101 :
                       ((ALUOp == 2'b10) & (funct3 == 3'b110)) ? 3'b011 :
                       ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 3'b010 :
                       3'b000;
endmodule
