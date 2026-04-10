
`timescale 1ns / 1ps
module TB_CombFB;
reg In;
wire [3:0] Out;

CombFB U_counter(.In(In), .Out(Out)); 



initial begin
	In = 1'b0;
	
	#100 In = 1'b1;
	#100 In = 1'b0;
	#100 In = 1'b1;
	#100 $stop;
end
endmodule

