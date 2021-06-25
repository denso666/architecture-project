`timescale 1ns/1ns
module buffer_ex (
    input clk,
    input [4:0] in,
    output reg [4:0] out
);

    always @ (posedge clk) out = in;

endmodule // buffer_ex
