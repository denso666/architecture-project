module buffer_a (
    input clk,
    input [31:0] inAdd, inInsMem,
    output reg [31:0] outAdd, outInsMem
);
    always @ (negedge clk) begin
        outAdd = inAdd;
        outInsMem = inInsMem;
    end
endmodule // buffer_a
