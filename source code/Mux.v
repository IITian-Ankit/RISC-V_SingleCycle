module Mux(a,b,s,c,);

   //Input and Output declaration
   input [31:0] a,b;
   input s;
   output [31:0] c;

   //Assigning the outputs based on inputs
    assign c = (s == 1'b0) ? a : b;

endmodule
