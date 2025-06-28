//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 02:08:44 PM
// Design Name: 
// Module Name: Instr_Mem
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


module Instr_Mem(A,rst,RD);
    //Input/Output declaration
    input [31:0] A;
    input rst;
    output [31:0] RD;
    
    //Memory declaration
    reg[31:0] Mem[1023:0]; //This means we are declaring a register which consists of 1024 memory each of a size of 32 bits
    
    assign RD = (rst == 1'b0) ? 32'h00000000 : Mem[A[31:2]]; // If we have set the reset as zero then we will give zero as the output or else we will find the memory with address A and give the desired output

   //Assigning Instruction to the Instruction Memory

   initial begin
     $readmemh("memfile.hex",Mem);
   end
/* We can assign manually but we will fetch it from a hex file
   initial begin
    //Mem[0] = 32'hFFC4A303;
    //Mem[1] = 32'h00832383;
    //Mem[0] = 32'h0064A423;
    Mem[0] = 32'h0062E233;

   end
*/
endmodule
