//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 08:14:28 PM
// Design Name: 
// Module Name: P_C
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


module P_C(PC_NEXT,clk,rst,PC);
     
     //Input and Output declaration
     input clk,rst;
     input [31:0] PC_NEXT;
     //Assigning reg to the PC
     output reg [31:0] PC; //We are assigning a reg because we want it to change its value in every clock cycle, which cannot be done in assigning a wire.
     
     always @(posedge clk)
     begin
     if(~rst)
     begin
     PC <= 32'h00000000; //we use '<=' instead of '=' because '=' because it is a sequential logic in a block.
     end
     else 
     begin
     PC <= PC_NEXT; //as after each positive trigger PC_NEXT changes its value, we will look to all values less than PC_NEXT so that there won't be any errors in updating values
     end
     end
endmodule
