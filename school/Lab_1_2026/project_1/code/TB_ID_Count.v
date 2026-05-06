`timescale 1ns/1ps

module TB_ID_Count;
reg clk, rst;
wire [3:0] out;

ID_Count U_ID_Count(.rst(rst), .clk(clk), .out(out));

always begin
#10;
clk=~clk;
end

initial
begin
    rst=1'b1;
    clk=1'b0;
    
    #100 rst=1'b0;
    #1000 $finish;
end
endmodule