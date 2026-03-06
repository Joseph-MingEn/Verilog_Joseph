`timescale 1ns / 1ps

module TB_IDcounter;
//wire out2;
reg rst, clk;

wire D0;
wire D1;
wire D2;
wire D3;

ID_Counter U_IDCounter(.clk(clk), .rst(rst), .D0(D0), .D1(D1), .D2(D2), .D3(D3));

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