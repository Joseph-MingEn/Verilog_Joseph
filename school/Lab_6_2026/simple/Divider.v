module Divider(In_1, In_0, Out);
parameter BusWidth=5;

input [BusWidth:0]In_1;
input [BusWidth:0]In_0;
output [BusWidth:0]Out;

assign Out= In_1 / In_0;

endmodule

