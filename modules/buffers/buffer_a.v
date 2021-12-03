`timescale 1ns/1ns
module buffer_a (
    input clk,
    input [31:0] inAdd,
    input [31:0] inInsMem,
    output reg [31:0] outAdd,
    output reg [31:0] outInsMem
);
    initial $printtimescale(buffer_a);

    always @ (posedge clk) begin
        outAdd <= inAdd;
        outInsMem <= inInsMem;
    end
endmodule // buffer_a
