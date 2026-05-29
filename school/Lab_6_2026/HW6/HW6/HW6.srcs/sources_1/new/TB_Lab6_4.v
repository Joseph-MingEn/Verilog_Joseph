`timescale 1ns / 1ps

module TB_Lab6_4;

reg clk;
reg rst;

reg [1:0] div_sel;
reg [1:0] duty_sel;
reg lfsr_sel;

wire [3:0] led;

Lab6_4_Top DUT(
    .clk(clk),
    .rst(rst),
    .div_sel(div_sel),
    .duty_sel(duty_sel),
    .lfsr_sel(lfsr_sel),
    .led(led)
);

// 100MHz Clock
always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;

    div_sel = 2'b00;
    duty_sel = 2'b01;   // 50% duty
    lfsr_sel = 1'b0;    // 3-bit LFSR

    #20;
    rst = 0;

    //--------------------------------
    // 3-bit LFSR
    //--------------------------------
    #400;

    //--------------------------------
    // 切換成 4-bit LFSR
    //--------------------------------
    lfsr_sel = 1'b1;

    #800;

    //--------------------------------
    // 測試不同除頻倍率
    //--------------------------------
    div_sel = 2'b01;
    #400;

    div_sel = 2'b10;
    #400;

    //--------------------------------
    // 測試不同 Duty Cycle
    //--------------------------------
    duty_sel = 2'b00;   // 25%
    #400;

    duty_sel = 2'b10;   // 75%
    #400;

    $stop;

end

endmodule