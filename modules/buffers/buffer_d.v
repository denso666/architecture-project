module buffer_d (
    input clk,
    input [31:0] inReadData, inOutAlu,
    input [4:0] inMux5b,
    output reg [31:0] outReadData, outOutAlu,
    output reg [4:0] outMux5b
);

    always @ (negedge clk) begin
        outReadData = inReadData;
        outOutAlu = inOutAlu;
        outMux5b = inMux5b;
    end

endmodule // buffer_d
