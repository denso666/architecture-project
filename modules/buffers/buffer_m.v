module buffer_m (
    input clk,
    input [2:0] in,
    output reg [2:0] out
);

    always @ (negedge clk) out = in;

endmodule // buffer_m
