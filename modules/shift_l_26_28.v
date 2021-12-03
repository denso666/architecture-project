`timescale 1ns/1ns
module shift_l_2628 (
    input [25:0] in,
    output [27:0] out
);

    assign out = in << 2;

endmodule //shift_l_2628
