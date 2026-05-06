module Behavioral (clk, rst, out, in);
input clk, rst;
input [2:0] in;
output [3:0] out;
reg [3:0] out;

always @(*) begin
if (rst == 1'b1) begin 
    out = 4'b0000;
   end
   else begin
    case (in)
             (3'b000): out = 4'b0000 ;
             (3'b001): out = 4'b0001 ;
             (3'b010): out = 4'b0011 ;
             (3'b011): out = 4'b0110 ;
             (3'b100): out = 4'b1100 ;
             (3'b101): out = 4'b0000 ;
             (3'b110): out = 4'b0000 ;
             (3'b111): out = 4'b1000 ;
             default: out = 4'bxxxx;
    endcase
    end
end
endmodule