module ForAdder(In_A, In_B, Cin, Sum, Cout);
parameter BusWidth=5;

input [BusWidth:0]In_A;
input [BusWidth:0]In_B;
input Cin;
output [BusWidth:0]Sum;
reg    [BusWidth:0]Sum;
output Cout;

reg    [BusWidth:0] C_i;

integer idx;

assign Cout=C_i[BusWidth];

always begin
    {C_i[0], Sum[0]} = In_A[0] + In_B[0] + Cin;
end


always begin
    for (idx = 1; idx <= BusWidth; idx = idx + 1) begin
	    {C_i[idx], Sum[idx]} = In_A[idx] + In_B[idx] + C_i[idx-1];
	end	
end

endmodule



//always begin
//    {C_i[BusWidth], Sum[BusWidth]} = In_A[BusWidth] + In_B[BusWidth] + C_i[BusWidth-1];
//end