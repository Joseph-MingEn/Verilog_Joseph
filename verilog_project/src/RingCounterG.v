module RingCounterG(clk, rst, Q1, Q2, Q3);
input clk, rst;
output Q1, Q2, Q3;
wire Q0;

assign Q0=~Q3;

D_FF U1(.out(Q1), .in(Q0), .clk(clk), .rst(rst));
D_FF U2(.out(Q2), .in(Q1), .clk(clk), .rst(rst));
D_FF U3(.out(Q3), .in(Q2), .clk(clk), .rst(rst));

endmodule