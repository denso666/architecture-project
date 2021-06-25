`timescale 1ns/1ns
module buffer_b (
    input clk,
    input [31:0] inAdder,
    input [31:0] inRD1,
    input [31:0] inRD2,
    input [31:0] inSignExt,
    input [4:0] inInsA,
    input [4:0] inInsB,
    output reg [31:0] outAdder,
    output reg [31:0] outRD1,
    output reg [31:0] outRD2,
    output reg [31:0] outSignExt,
    output reg [4:0] outInsA,
    output reg [4:0] outInsB
);

    always @ (posedge clk) begin
        outAdder = inAdder;
        outRD1 = inRD1;
        outRD2 = inRD2;
        outSignExt = inSignExt;
        outInsA = inInsA;
        outInsB = inInsB;
    end

endmodule // buffer_b
