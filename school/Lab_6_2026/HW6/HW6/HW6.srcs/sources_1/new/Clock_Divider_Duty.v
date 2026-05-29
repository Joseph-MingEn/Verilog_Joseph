module Clock_Divider_Duty(
    input clk,
    input rst,
    input [1:0] div_sel,
    input [1:0] duty_sel,
    output reg slow_clk
);

reg [25:0] count;
reg [25:0] period;
reg [25:0] high_time;

// 切換除頻倍率
always @(*) begin
    case(div_sel)
        2'b00: period = 26'd8;
        2'b01: period = 26'd16;
        2'b10: period = 26'd32;
        2'b11: period = 26'd64;
        default: period = 26'd8;
    endcase
end

// 切換 duty cycle
always @(*) begin
    case(duty_sel)
        2'b00: high_time = period >> 2;          // 25%
        2'b01: high_time = period >> 1;          // 50%
        2'b10: high_time = (period >> 1) + (period >> 2); // 75%
        2'b11: high_time = period >> 1;          // 50%
        default: high_time = period >> 1;
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 26'd0;
        slow_clk <= 1'b0;
    end
    else begin
        if (count >= period - 1) begin
            count <= 26'd0;
        end
        else begin
            count <= count + 1'b1;
        end

        if (count < high_time) begin
            slow_clk <= 1'b1;
        end
        else begin
            slow_clk <= 1'b0;
        end
    end
end

endmodule