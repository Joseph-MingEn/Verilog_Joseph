module ID_Count (rst, clk, out);
input rst, clk;
output [3:0] out;
wire Q4, Q3, Q2, Q1;
Ring R1(.clk(clk), .rst(rst), .Q4(Q4), .Q3(Q3), .Q2(Q2), .Q1(Q1));
LUD_ID L1(.rst(rst), .clk(clk), .A3(Q4), .A2(Q3), .A1(Q2), .A0(Q1), .out(out));
    
endmodule