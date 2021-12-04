`timescale 1ns/1ns
module buffer_c (
    input clk,
    input [31:0] inAdder,
    input inZf,
    input [31:0] inOutAlu,
    input [31:0] inRD2,
    input [4:0] inMux5b,
    input [31:0] inJump,
    output reg [31:0] outAdder,
    output reg outZf,
    output reg [31:0] outOutAlu,
    output reg [31:0] outRD2,
    output reg [4:0] outMux5b,
    output reg [31:0] outJump

);
    initial $printtimescale(buffer_c);

    always @ (posedge clk) begin
        outAdder <= inAdder;
        outZf <= inZf;
        outOutAlu <= inOutAlu;
        outRD2 <= inRD2;
        outMux5b <= inMux5b;
        outJump <= inJump;
    end

endmodule // buffer_c
