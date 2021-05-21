module pc (
    input [31:0] INS,
    input clk,
    output reg [31:0] INS_OUT
);

    always @ (posedge clk) INS_OUT <= INS;

endmodule // pc
