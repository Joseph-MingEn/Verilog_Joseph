module Clock_Divider_Sel(
    input clk,
    input rst,
    input [1:0] sel,
    output reg slow_clk
);

reg [25:0] count;
reg [25:0] max_count;

always @(*) begin
    case(sel)
        2'b00: max_count = 26'd4;          // 模擬用：最快
        2'b01: max_count = 26'd9;          // 較慢
        2'b10: max_count = 26'd19;         // 更慢
        2'b11: max_count = 26'd49;         // 最慢
        default: max_count = 26'd4;
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 26'd0;
        slow_clk <= 1'b0;
    end
    else begin
        if (count >= max_count) begin
            count <= 26'd0;
            slow_clk <= ~slow_clk;
        end
        else begin
            count <= count + 1'b1;
        end
    end
end

endmodule
/*
2'b00: max_count = 26'd5_999_999;
2'b01: max_count = 26'd11_999_999;
2'b10: max_count = 26'd24_999_999;
2'b11: max_count = 26'd49_999_999;
*/