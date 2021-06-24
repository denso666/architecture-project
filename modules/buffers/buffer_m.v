module buffer_m (
    input clk,
    input [3:0] in,
    output reg [3:0] out
);

    always @ (negedge clk) out = in;

endmodule // buffer_m
