`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/23 00:05:30
// Design Name: 
// Module Name: CLK_DIV
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CLK_DIV(
    input clk,
    input rst,
    output reg slow_clk
    );

reg [26:0] counter; // 100M

always @(posedge clk or posedge rst) begin 
    if (rst) begin
        counter <= 0;
        slow_clk <= 0;
    end else begin
        if (counter == 50000000 - 1) begin
            counter <= 0;
            slow_clk <= ~slow_clk;
        end else begin
            counter <= counter - 1;
        end
    end 
end 
endmodule
