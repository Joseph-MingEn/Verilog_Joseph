
`timescale 1ns / 1ps

`define halfT 10

module TB_LFSR;

reg rst, clk, In;

wire [2:0] ShiftReg3;
wire Out;

LFSR U_ShiftReg3(.clk(clk), .rst(rst), .In(In), .Out(Out), .ShiftReg3(ShiftReg3)); 

always begin
//#20
# `halfT
clk=~clk;
end

initial begin
    rst= 1'b0;
	clk= 1'b0;
	In=1'b1;
	
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

