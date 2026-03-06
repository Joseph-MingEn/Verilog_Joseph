`timescale 1ns / 1ps

module TB_CR6;
//wire out2;
reg rst, clk;

wire count1;
wire count2;
wire count3;

RingCounterG U_CR_6(.clk(clk), .rst(rst), .Q1(count1), .Q2(count2), .Q3(count3));

always begin
#10
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