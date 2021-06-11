module buffer_ex (
    input clk,
    input [4:0] in,
    output reg [4:0] out
);

    always @ (negedge clk) out = in;

endmodule // buffer_ex
