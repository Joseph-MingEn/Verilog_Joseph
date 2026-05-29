`timescale 1ns / 1ps

module Lab6_1_Top(
    input clk,          // FPGA clock
    input rst,          // reset
    output [2:0] led    // LED 顯示 LFSR 輸出
);

wire slow_clk;
wire [2:0] lfsr_out;

// 除頻電路
Clock_Divider U0(
    .clk(clk),
    .rst(rst),
    .slow_clk(slow_clk)
);

// 3-bit LFSR
LFSR_3bit U1(
    .clk(slow_clk),
    .rst(rst),
    .q(lfsr_out)
);

// LED 顯示 LFSR 狀態
assign led = lfsr_out;

endmodule


module Clock_Divider(
    input clk,
    input rst,
    output reg slow_clk
);

reg [25:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 26'd0;
        slow_clk <= 1'b0;
    end
    else begin
        if (count == 26'd24_999_999) begin
            count <= 26'd0;
            slow_clk <= ~slow_clk;
        end
        else begin
            count <= count + 1'b1;
        end
    end
end

endmodule


module LFSR_3bit(
    input clk,
    input rst,
    output reg [2:0] q
);

wire feedback;

// x^3 + x + 1
assign feedback = q[2] ^ q[0];

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 3'b001;   // LFSR 不可以從 000 開始
    end
    else begin
        q <= {q[1:0], feedback};
    end
end

endmodule