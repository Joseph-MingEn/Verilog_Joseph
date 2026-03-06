module ID_Counter(clk, rst, D0, D1, D2, D3);
input clk, rst;
output D0, D1, D2, D3;

wire A0, A1, A2;

RingCounterG U_CR_6(.clk(clk), .rst(rst), .Q1(A0), .Q2(A1), .Q3(A2));
B_xxxxxxxx LUT_ID(.A0(A0), .A1(A1), .A2(A2), .D0(D0), .D1(D1), .D2(D2), .D3(D3));

endmodule