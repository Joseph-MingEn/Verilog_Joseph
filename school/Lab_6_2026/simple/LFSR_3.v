
`timescale 1ns / 1ps
module LFSR(clk, rst, In, Out, ShiftReg3); 
input clk, rst, In;
output reg [2:0] ShiftReg3;
output Out;

always@(posedge clk) begin
    if(rst == 1'b1) begin
        ShiftReg3 <= 3'b000;
    end
	else begin
        ShiftReg3 <= ShiftReg3<<1;
		ShiftReg3[0] <= Out^In;
	end
end

assign Out = ShiftReg3[0]^ShiftReg3[2];

endmodule



