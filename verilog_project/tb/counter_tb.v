`timescale 1ns/1ps

module counter_tb;

reg clk;
reg rst;
wire [3:0] count;

counter uut (
            .clk(clk),
            .rst(rst),
            .count(count)
        );

always #5 clk = ~clk;

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0, counter_tb);

    clk = 0;
    rst = 1;

    #10 rst = 0;

    #100 $finish;
end

endmodule
