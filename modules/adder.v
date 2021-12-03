`timescale 1ns/1ns
module adder (
    input [31:0] A, B,
    output [31:0] R
);
    assign R = A + B;

endmodule // adder
