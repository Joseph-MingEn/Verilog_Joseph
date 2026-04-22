
`timescale 1ns / 1ps
module TB_MulAdd_0;

reg rst, clk;
reg [3:0] A, B;
wire [4:0] Sum;
wire [7:0] Pdt;
wire [8:0] Total;
wire [8:0] Y;

wire [4:0] Sum_S;
wire [7:0] Pdt_S;
wire [8:0] Total_S;
wire [8:0] Y_S;
 
MulAdd_1   U_test(.clk(clk), .rst(rst), .A(A), .B(B), 
                  .Sum(Sum), .Pdt(Pdt), .Total(Total), .Y(Y));

MulAdd_1_Sign   U_test_Sign(.clk(clk), .rst(rst), .A(A), .B(B), 
                            .Sum(Sum_S), .Pdt(Pdt_S), .Total(Total_S), .Y(Y_S));

always begin
#10
clk=~clk;
end

initial begin
    rst= 1'b0;
	clk= 1'b0;
	A = 4'h0;
	B = 8'h00;
	
	#30   rst=1'b1;
	#30   rst=1'b0;
	
	#30   A = 4'd5;
	      B = 4'd6;
	      
	#30   A = 4'd3;
	      B = -4'd7;

		  
	#100 $stop;
end
endmodule


module MulAdd_1(clk, rst, A, B, 
                Sum, Pdt, Total, Y); 
input clk, rst;
input [3:0] A, B;
output [4:0] Sum;
output [7:0] Pdt;
output [8:0] Total;
output [8:0] Y;
reg    [8:0] Y;

assign Pdt = A*B;

assign Sum = A+B;

assign Total = Pdt+Sum;    

always @(posedge clk) begin
    if( (rst == 1'b1)) begin
	    Y <= 9'h0_00;
	end
	else begin
		Y <= Total;
	end
	
end
endmodule


module MulAdd_1_Sign(clk, rst, A, B, 
                     Sum, Pdt, Total, Y); 
input clk, rst;
input  signed [3:0] A, B;
output signed [4:0] Sum;
output signed [7:0] Pdt;
output signed [8:0] Total;
output signed [8:0] Y;
reg    signed [8:0] Y;

assign Pdt = A*B;

assign Sum = A+B;

assign Total = Pdt+Sum;    

always @(posedge clk) begin
    if( (rst == 1'b1)) begin
	    Y <= 9'h0_00;
	end
	else begin
		Y <= Total;
	end
	
end
endmodule
