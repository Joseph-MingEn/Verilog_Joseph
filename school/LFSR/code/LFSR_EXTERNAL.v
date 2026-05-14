module LFSR_EXTERNAL (
    input clk,
    input rst,
    output reg [3:0] Q
);

wire feedback;

// P(x)=x^4+x^3+1
assign feedback = Q[3] ^ Q[2];

always @(posedge clk or posedge rst) begin
    if (rst) begin
        Q <= 4'b1111;       // 不可為 0000
    end
    else begin
        Q <= {Q[2:0], feedback};
    end
end

endmodule