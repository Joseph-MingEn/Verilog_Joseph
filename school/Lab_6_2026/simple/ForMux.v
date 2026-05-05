module ForMux(In_1, In_0, Sel, Out);
parameter BusWidth=5;

input [BusWidth:0]In_1;
input [BusWidth:0]In_0;
input Sel;
output [BusWidth:0]Out;
//reg    [BusWidth:0]Out;

//integer idx;

//always begin
//    for (idx = 0; idx <= BusWidth; idx = idx + 1) begin
//	    Out[idx]=Sel ? In_1[idx] : In_0[idx];
//	end	
//end

assign Out=Sel ? In_1 : In_0;

endmodule