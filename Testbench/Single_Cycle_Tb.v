//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2025 04:23:30 PM
// Design Name: 
// Module Name: Single_Cycle_Top_Tb
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


module Single_Cycle_Top_Tb();

   //Assigning Inputs of testbench
     reg clk = 1'b1, rst;
     
    //Assigning the module in which testbench has to be simulated
    Single_Cycle_Top Single_Cycle_Top(
           .clk(clk),
           .rst(rst)
       );

   initial begin 
       $dumpfile("Single Cycle.vcd");
       $dumpvars(0);
   end
       
    always
    begin
         clk = ~clk;
         #50;
    end
    
    initial
    begin
         rst = 1'b0;
         #100;
         
         rst = 1'b1;
         #300
       $finish;
    end
    
endmodule
