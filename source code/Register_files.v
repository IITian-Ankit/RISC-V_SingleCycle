//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 09:26:16 PM
// Design Name: 
// Module Name: Reg_file
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


module Reg_file(A1,A2,A3,WD3,clk,WE3,rst,RD1,RD2);
      input clk,rst,WE3;
      input [4:0] A1,A2,A3;
      input [31:0] WD3;
      output [31:0] RD1,RD2;
      
      //creation of memory
      reg [31:0] Registers[31:0]; //The size of registers is of 32 bits and there are 32 registers in the memory
      
      //assigning read from the registers
      assign RD1 = (~rst) ? 32'd0 : Registers[A1];
      
      assign RD2 = (~rst) ? 32'd0 : Registers[A2];
      
      always @(posedge clk) begin
         if (WE3)
         begin
         Registers[A3] <= WD3;
         end
      end

      initial begin
          Registers[5] = 32'h00000005;
          Registers[6] = 32'h00000004;
      end
endmodule
