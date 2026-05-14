module LFSR_INTERNAL (
    input clk,
    input rst,
    output reg [3:0] Q
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        Q <= 4'b1111;       // 不可為 0000
    end
    else begin
        Q[3] <= Q[2];
        Q[2] <= Q[1] ^ Q[3]; // internal XOR tap
        Q[1] <= Q[0];
        Q[0] <= Q[3];
    end
end

endmodule