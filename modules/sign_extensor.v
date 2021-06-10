module sign_extensor (
    input [15:0] IN,
    output [31:0] OUT
);

    assign OUT = { { 16 { IN[15] } }, IN };

endmodule // sign_extensor
