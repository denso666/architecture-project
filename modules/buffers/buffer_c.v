module buffer_c (
    input clk,
    input [31:0] inAdder,
    input inZf,
    input [31:0] inOutAlu, inRD2,
    input [4:0] inMux5b,
    output reg [31:0] outAdder,
    output reg outZf,
    output reg [31:0] outOutAlu, outRD2,
    output reg [4:0] outMux5b

);

    always @ (negedge clk) begin
        outAdder = inAdder;
        outZf = inZf;
        outOutAlu = inOutAlu;
        outRD2 = inRD2;
        outMux5b = inMux5b;
    end

endmodule // buffer_c
