`timescale 1ns/1ps

module TB_LFSR_COMPARE;
reg clk, rst;
wire [3:0] Q_ext;
wire [3:0] Q_int;

LFSR_EXTERNAL U1 (.clk(clk), .rst(rst), .Q(Q_ext));

LFSR_INTERNAL U2 (.clk(clk), .rst(rst), .Q(Q_int));

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;

    #20 rst = 0;

    #200 $finish;
end

endmoduleㄚ