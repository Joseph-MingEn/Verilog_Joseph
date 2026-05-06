module Dataflow (clk, rst, in, out);
input clk, rst;
input [2:0] in;
output [3:0] out;

assign out = (in == 3'b000)? 4'b0000 :
             (in == 3'b001)? 4'b0001 :
             (in == 3'b010)? 4'b0011 :
             (in == 3'b011)? 4'b0110 :
             (in == 3'b100)? 4'b1100 :
             (in == 3'b101)? 4'b0000 :
             (in == 3'b110)? 4'b0000 :
             (in == 3'b111)? 4'b1000 : 
             4'bxxxx;
    
endmodule