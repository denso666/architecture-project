module buffer_b (
    input clk,
    input [31:0] inAdder, inRD1, inRD2, inSignExt,
    input [4:0] inInsA, inInsB,
    output reg [31:0] outAdder, outRD1, outRD2, outSignExt,
    output reg [4:0] outInsA, outInsB
);

    always @ (negedge clk) begin
        outAdder = inAdder;
        outRD1 = inRD1;
        outRD2 = inRD2;
        outSignExt = inSignExt;
        outInsA = inInsA;
        outInsB = inInsB;
    end

endmodule // buffer_b
