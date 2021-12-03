`timescale 1ns/1ns
module shift_l (
    input [31:0] IN,
    output [31:0] OUT
);

    assign OUT = IN << 2;

endmodule // shift_l
