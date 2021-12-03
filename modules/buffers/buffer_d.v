`timescale 1ns/1ns
module buffer_d (
    input clk,
    input [31:0] inReadData,
    input [31:0] inOutAlu,
    input [4:0] inMux5b,
    output reg [31:0] outReadData,
    output reg [31:0] outOutAlu,
    output reg [4:0] outMux5b
);

    initial $printtimescale(buffer_d);

    always @ (posedge clk) begin
        outReadData <= inReadData;
        outOutAlu <= inOutAlu;
        outMux5b <= inMux5b;
    end

endmodule // buffer_d
