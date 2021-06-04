module pc (
    input clk,
    input [31:0] INS,
    output reg [31:0] INS_OUT
);
    initial INS_OUT = 32'b0;

    always @ ( posedge clk ) INS_OUT = INS;

endmodule // pc
