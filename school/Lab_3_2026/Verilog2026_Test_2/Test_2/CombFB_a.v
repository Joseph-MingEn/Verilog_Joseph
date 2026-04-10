
`timescale 1ns / 1ps
module CombFB(In, Out); 
input In;
output [3:0] Out;
reg [3:0] Out;

//==== Org_State ===
//always @(posedge rst or posedge clk) begin
always @(*) begin
    if(In == 1'b0) begin 
	    Out= 4'h0;
	end
	else begin
	    Out= Out+1'b1;
	end
end

endmodule

