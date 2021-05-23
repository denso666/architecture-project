module pc (
    input [31:0] INS,
    input clk,
    output reg [31:0] INS_OUT
);
    initial INS_OUT = 32'b0;

    always @ ( posedge clk ) begin
        if ( INS ) INS_OUT = INS;
    end

endmodule // pc
