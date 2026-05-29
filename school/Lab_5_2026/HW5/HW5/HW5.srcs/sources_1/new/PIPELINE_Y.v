`timescale 1ns / 1ps

module PIPELINE_Y(
    input clk,
    input rst,
    output reg [2:0] count,
    output reg [5:0] Y
);

reg [3:0] B_reg, C_reg, D_reg;
reg [4:0] stage1_sum;
reg [5:0] stage2_sum;

reg [2:0] valid_shift;

reg [3:0] A, B, C, D;

always @(*) begin
    case(count)
        3'd0: begin A=4'h0; B=4'h1; C=4'h3; D=4'h6; end // Y1
        3'd1: begin A=4'h1; B=4'h3; C=4'h6; D=4'hC; end // Y2
        3'd2: begin A=4'h3; B=4'h6; C=4'hC; D=4'h0; end // Y3
        3'd3: begin A=4'h6; B=4'hC; C=4'h0; D=4'h0; end // Y4
        3'd4: begin A=4'hC; B=4'h0; C=4'h0; D=4'h8; end // Y5
        default: begin A=4'd0; B=4'd0; C=4'd0; D=4'd0; end
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 3'd0;
        B_reg <= 4'd0;
        C_reg <= 4'd0;
        D_reg <= 4'd0;
        stage1_sum <= 5'd0;
        stage2_sum <= 6'd0;
        Y <= 6'd0;
        valid_shift <= 3'b000;
    end else begin
        // Stage 3
        Y <= stage2_sum + D_reg;

        // Stage 2
        stage2_sum <= stage1_sum + C_reg;

        // Stage 1
        stage1_sum <= A + B;

        // buffer C, D
        C_reg <= C;
        D_reg <= D;

        valid_shift <= {valid_shift[1:0], 1'b1};

        if (count == 3'd4)
            count <= 3'd0;
        else
            count <= count + 3'd1;
    end
end

endmodule