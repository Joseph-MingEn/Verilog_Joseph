module LFSR_3bit(
    input clk,
    input rst,
    output reg [2:0] q
);

wire feedback;

assign feedback = q[2] ^ q[0];

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 3'b001;
    end
    else begin
        q <= {q[1:0], feedback};
    end
end

endmodule