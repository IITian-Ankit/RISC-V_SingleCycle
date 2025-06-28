`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 10:09:42 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(A,WE,clk,WD,RD);

   //Input/Output declaration
   input[31:0] A,WD;
   input clk,WE;
   output [31:0] RD;
   
   //Declaring data memory
   reg [31:0] Data [1023:0];    //It is declaring an array memory which consists of 1024 32-bit registers.
   //Assigning read function
   assign RD = (WE == 1'b0) ? Data[A] : 32'd0;
    
   //To simulate that memory location 28 holds a specific value
   initial begin
      Data[28] = 32'h00000020;
      Data[40] = 32'h00000002;
    end
   //Assigning write function
   always @(posedge clk) begin
         if (WE)
         begin
         Data[A] <= WD;
         end
   end    
endmodule
