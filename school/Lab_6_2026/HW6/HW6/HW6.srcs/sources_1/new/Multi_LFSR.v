module Multi_LFSR_4LED(
    input clk,
    input rst,
    input lfsr_sel,
    output reg [3:0] q
);

wire fb3;
wire fb4;

// 3-bit: x^3 + x + 1
assign fb3 = q[2] ^ q[0];

// 4-bit: x^4 + x^3 + 1
assign fb4 = q[3] ^ q[2];

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 4'b0001;
    end
    else begin
        if (lfsr_sel == 1'b0) begin
            // 3-bit LFSR，只使用 q[2:0]，q[3] 固定為 0
            q <= {1'b0, q[1:0], fb3};
        end
        else begin
            // 4-bit LFSR，使用 q[3:0]
            q <= {q[2:0], fb4};
        end
    end
end

endmodule