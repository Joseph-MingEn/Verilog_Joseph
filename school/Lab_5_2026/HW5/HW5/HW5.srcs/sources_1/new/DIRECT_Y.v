`timescale 1ns / 1ps

module DIRECT_Y(
    input clk,
    input rst,
    output reg [2:0] count,
    output reg [5:0] Y
);

wire [3:0] A0 = 4'h0;
wire [3:0] A1 = 4'h1;
wire [3:0] A2 = 4'h3;
wire [3:0] A3 = 4'h6;
wire [3:0] A4 = 4'hC;
wire [3:0] A5 = 4'h0;
wire [3:0] A6 = 4'h0;
wire [3:0] A7 = 4'h8;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 3'd0;
        Y <= 6'd0;
    end else begin
        case(count)
            3'd0: Y <= A0 + A1 + A2 + A3; // Y1 = 10
            3'd1: Y <= A1 + A2 + A3 + A4; // Y2 = 22
            3'd2: Y <= A2 + A3 + A4 + A5; // Y3 = 21
            3'd3: Y <= A3 + A4 + A5 + A6; // Y4 = 18
            3'd4: Y <= A4 + A5 + A6 + A7; // Y5 = 20
            default: Y <= 6'd0;
        endcase

        if (count == 3'd4)
            count <= 3'd0;
        else
            count <= count + 3'd1;
    end
end

endmodule