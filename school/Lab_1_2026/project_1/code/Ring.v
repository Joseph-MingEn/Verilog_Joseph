module Ring (clk, rst, Q4, Q3, Q2, Q1);
input clk, rst;
output Q4, Q3, Q2, Q1;
wire Q0;
assign Q0=~Q4;
FF F1(.clk(clk), .rst(rst), .D(Q0), .Q(Q1));
FF F2(.clk(clk), .rst(rst), .D(Q1), .Q(Q2));
FF F3(.clk(clk), .rst(rst), .D(Q2), .Q(Q3));
FF F4(.clk(clk), .rst(rst), .D(Q3), .Q(Q4));    
endmodule