`timescale 1ns / 1ps
module Counter_GG(clk, rst, CountOut, IdOut); 
input clk, rst;
output [2:0] CountOut;
output [3:0] IdOut;

reg [2:0] CountOut;
reg [3:0] IdOut;

always @(*) begin
    case (CountOut)
        3'b000: IdOut = 4'h0;
        3'b001: IdOut = 4'h1;
        3'b010: IdOut = 4'h3;
        3'b011: IdOut = 4'h6;
        3'b100: IdOut = 4'hC;
        3'b101: IdOut = 4'h0;
        3'b110: IdOut = 4'h0;
        3'b111: IdOut = 4'h8;
        default: IdOut = 4'bxxxx;
    endcase
end

initial begin
       CountOut = 3'b000;
 #30   CountOut = 3'b000;
 #30   CountOut = 3'b001;
 #30   CountOut = 3'b010;
 #30   CountOut = 3'b011;
 #30   CountOut = 3'b100;
 #30   CountOut = 3'b101;
 #30   CountOut = 3'b110;
 #30   CountOut = 3'b111;
 #30   $stop;
end

endmodule