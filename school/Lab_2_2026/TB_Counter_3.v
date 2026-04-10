`timescale 1ns / 1ps

module TB_Counter;

reg rst, clk;

wire [1:0] Count_Out;
wire [2:0] ID_out;

Counter_3 U_Count3(.clk(clk), .rst(rst), .CountOut(Count_Out), .IdOut(ID_out)); 


always begin
#10
clk=~clk;
end

initial
begin
    rst=1'b1;
	clk=1'b0;
	
	#25 rst=1'b0;

	#100 $stop;
	
end

endmodule