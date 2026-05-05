
`timescale 1ns / 1ps

`define halfT 10

module TB_ClkDiv;

reg rst, clk;

wire [2:0] CountOut;
wire Duty50, Duty75;

ClkDiv U_Mid22(.clk(clk), .rst(rst), .CountOut(CountOut), .Duty50(Duty50), .Duty75(Duty75)); 

always begin
//#20
# `halfT
clk=~clk;
end

initial begin
    rst= 1'b0;
	clk= 1'b0;
	
	//#30   rst=1'b1;
	#`halfT
	#`halfT
	#`halfT
	#`halfT  rst=1'b1;
	#`halfT
	#`halfT
	#`halfT
	#`halfT  rst=1'b0;
end

endmodule

