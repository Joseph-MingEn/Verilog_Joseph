
`timescale 1ns / 1ps

`define halfT 7

module TB_PI4_pip;

reg rst, clk;
reg [3:0] A, B, C, D;
wire clk_o;
wire [7:0] AB;
wire [11:0] ABC; 
wire [15:0] ABCD, EndBuf;

PI4_pip Utest(.clk(clk), .clk_o(clk_o), .rst(rst), .A(A), .B(B), .C(C), .D(D), .AB(AB), .ABC(ABC), .ABCD(ABCD), .EndBuf(EndBuf));

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
	#`halfT
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
	#`halfT
	#`halfT
	#`halfT
	#`halfT
	#`halfT
    #`halfT
	#`halfT	         
	#`halfT
	#`halfT  $stop;
end
endmodule


`timescale 1ns / 1ps
module PI4_pip(clk, clk_o, rst, A, B, C, D, AB, ABC, ABCD, EndBuf); 
input clk, rst;
output clk_o;
input [3:0] A, B, C, D;

output reg [7:0] AB;
output reg [11:0] ABC;
output reg [15:0] ABCD;

output [15:0] EndBuf;
reg [15:0]    EndBuf;

assign clk_o=clk;

reg [3:0] Ai1, Bi1, Bi2, Ci1, Ci2, Ci3, Di1, Di2, Di3, Di4;

// 1st stage
always @(posedge clk) begin
    if( (rst == 1'b1)) begin
	    Ai1 <= 4'h0;
		Bi1 <= 4'h0;
		Ci1 <= 4'h0;
		Di1 <= 4'h0;
	end
	else begin
		Ai1 <= A;
		Bi1 <= B;
		Ci1 <= C;
		Di1 <= D;
	end
end

// 2nd stage
always @(posedge clk) begin 
    if( (rst == 1'b1)) begin
		Ci2 <= 4'h0;
		Di2 <= 4'h0;
	end
	else begin
		Ci2 <= Ci1;
		Di2 <= Di1;
	end
end

always @(posedge clk) begin 
    if( (rst == 1'b1)) begin
	    AB <= 8'h00;
	end
	else begin
		AB <= Ai1*Bi1;
	end
end

// 3rd stage
always @(posedge clk) begin 
    if( (rst == 1'b1)) begin
		Di3 <= 4'h0;
	end
	else begin
		Di3 <= Di2;
	end
end

always @(posedge clk) begin 
    if( (rst == 1'b1)) begin
	    ABC <= 12'h000;
	end
	else begin
		ABC <= AB*Ci2;
	end
end

// 4th stage
always @(posedge clk) begin 
    if( (rst == 1'b1)) begin
	    ABCD <= 16'h0000;
	end
	else begin
		ABCD <= ABC*Di3;
	end
end

// 5th stage
always @(posedge clk) begin 
    if( (rst == 1'b1)) begin
	    EndBuf <= 16'h0000;
	end
	else begin
		EndBuf <= ABCD;
	end
end

endmodule



