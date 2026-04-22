`timescale 1ns / 1ps
module TB_DoubleHalf;

reg rst, clk;
reg [3:0] A;          
reg signed [3:0] B;   
wire [4:0] Double;
wire [4:0] Half;
wire signed [4:0] Double_S;
wire signed [4:0] Half_S; 

assign Double = A << 1;
assign Half   = A >> 1;

assign Double_S = B <<< 1;
assign Half_S   = B >>> 1; 

initial begin
    rst = 1'b0;
    clk = 1'b0;
    A = 4'd0;
    B = 4'd0;
    
    #30 rst = 1'b1;
    #30 rst = 1'b0;
    
    #30 A = 4'd5;  
        B = 4'd6;  
        
    #30 A = -4'd3; 
        B = -4'd7; 
                   
                   

    #100 $finish;
end
endmodule

