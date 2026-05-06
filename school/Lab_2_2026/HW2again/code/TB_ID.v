`timescale 1ns/1ps

module TB_ID;
reg clk, rst;
wire [3:0] out1, out2;
reg [2:0] in;

Dataflow U_1(.rst(rst), .clk(clk), .out(out1), .in(in));
Behavioral U_2(.rst(rst), .clk(clk), .out(out2), .in(in));
always
begin
    #10
     clk=~clk;
end

initial
begin
    rst=1'b1;
    clk=1'b0;

    #100 rst=1'b0;
    #100 in = 3'b000;
    #100 in = 3'b001;
    #100 in = 3'b010;
    #100 in = 3'b011;
    #100 in = 3'b100;
    #100 in = 3'b101;
    #100 in = 3'b110;
    #100 in = 3'b111;
    #100 $finish;
end
endmodule
