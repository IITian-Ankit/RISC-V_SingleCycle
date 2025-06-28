//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2025 08:32:43 PM
// Design Name: 
// Module Name: main_decoder
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


module main_decoder(op,zero,Regwrite,Memwrite,ResultSrc,ALUSrc,ImmSrc,ALUOp,PCSrc);
 // Inputs/ Outputs declaration
 input zero;
 input [6:0] op;
 output Regwrite,Memwrite,ResultSrc,ALUSrc,PCSrc;
 output [1:0] ImmSrc,ALUOp;
 
 //interim wire (declaring branch as wire coz we will use it internally in the main decoder)
 wire branch;
 
 assign Regwrite = ((op == 7'b0000011) | (op == 7'b0110011)) ? 1'b1 : 1'b0;
 
 assign Memwrite = (op == 7'b0100011) ? 1'b1 : 1'b0;
 
 assign ResultSrc = (op == 7'b0000011) ? 1'b1 : 1'b0;
 
 assign ALUSrc = ((op == 7'b0000011) | (op == 7'b0100011)) ? 1'b1 : 1'b0;
 
 assign PCSrc = (zero & branch);
 
 assign branch = (op == 7'b1100011) ? 1'b1 : 1'b0;
 
 assign ImmSrc = (op == 7'b0100011) ? 2'b01 : (op == 7'b1100011) ? 2'b10 : 2'b00;
 
 assign ALUOp = (op == 7'b0110011) ? 2'b10 : (op == 7'b1100011) ? 2'b01 : 2'b00;
endmodule
