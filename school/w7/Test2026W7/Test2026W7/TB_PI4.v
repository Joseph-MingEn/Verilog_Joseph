
`timescale 1ns / 1ps

`define halfT 7

module TB_PI4;

reg rst, clk;
reg [3:0] A, B, C, D;
wire clk_o;
wire [7:0] AB;
wire [11:0] ABC; 
wire [15:0] ABCD, EndBuf;



PI4 Utest(.clk(clk), .clk_o(clk_o), .rst(rst), .A(A), .B(B), .C(C), .D(D), .AB(AB), .ABC(ABC), .ABCD(ABCD), .EndBuf(EndBuf));

always begin
//#20
# `halfT
clk=~clk;
end

initial begin
    rst= 1'b0;
	clk= 1'b0;
	A = 4'h0;
	B = 4'h0;
	C = 4'h0;
	D = 4'h0;
	
	//#30   rst=1'b1;
	#`halfT
	#`halfT
	#`halfT  rst=1'b1;
	#`halfT
	#`halfT
	#`halfT  rst=1'b0;
	
	#`halfT
	#`halfT
	#`halfT
	#`halfT  A = 4'h1;
	         B = 4'h2;
	         C = 4'h3;
	         D = 4'h4;

	#`halfT
	#`halfT  A = 4'h5;
	         B = 4'h6;
	         C = 4'h7;
	         D = 4'h8;
	         
	#`halfT
	#`halfT  A = 4'h9;
	         B = 4'hA;
	         C = 4'hB;
	         D = 4'hC;
	
    #`halfT
	#`halfT	         
	#`halfT
	#`halfT  $stop;
end
endmodule


`timescale 1ns / 1ps
module PI4(clk, clk_o, rst, A, B, C, D, AB, ABC, ABCD, EndBuf); 
input clk, rst;
output clk_o;
input [3:0] A, B, C, D;
output reg [7:0] AB;
output reg [11:0] ABC;
output reg [15:0] ABCD;
output [15:0] EndBuf;
reg [15:0]    EndBuf;

/*
assign AB =  A*B;
assign ABC =  AB*C;
assign ABCD  =  ABC*D;
*/

always @(*) begin
   AB = #1 A*B;
   ABC = #2 AB*C;
   ABCD  = #3 ABC*D;
end

assign clk_o=clk;

always @(posedge clk) begin
    if( (rst == 1'b1)) begin
	    EndBuf <= 16'h0000;
	end
	else begin
		EndBuf <= #1 ABCD;
	end	
end

endmodule