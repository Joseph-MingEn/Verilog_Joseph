
`timescale 1ns / 1ps
module TestDisplay;
wire [7:0] X=8'b1011_01_10;
wire [15:0] Y=16'hEAEB;
wire [7:0] W=8'b1001_1100;
wire [7:0] Z;

assign Z=Y[8:1];

reg [7:0] show_X;
reg [15:0] show_Y;
reg [7:0] show_XW;
reg [7:0] show_Z;

initial begin
    show_X = 8'b0000_0000;
	
#10 show_X = X;
	show_Y = Y;
	show_XW = X|W;
	show_Z = ~Z;
	
	$display("X = 8'b%b", X);
	$display("X = 8'd%d = 8'o%o = 8'h%h", X, show_X, X);
	$display("time=%t ps, Y = 16'h%h", $time, Y);
	
#10 $display("time=%t ps, Y = 16'b%b = 16'o%o = 16'd%d", 
              $time, Y, show_Y, show_Y);
    show_XW = X&W;
	show_Z = Z^W;

#10 $display("time=%t ps, Z = 8'b%b, ~Z = 8'b%b = 8'b%b",
              $time, Z, ~Z, show_Z);

#10 $display("time=%t ps, Z^W = 8'b%b, Z>>2 = 8'b%b", 
              $time, Z^W, Z>>2);
    show_XW = X^W;
	show_Z = Z>>2;

#10 $display("time=%t ps, W = 8'b%b, X|W = 8'b%b, X&W = 8'b%b,  X^W = 8'b%b", $time, W, X|W, X&W, X^W);

#100 $stop;	
	
end

endmodule


