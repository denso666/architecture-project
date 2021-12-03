`timescale 1ns/1ns
module pc (
    input clk,
    input [31:0] INS,
    output reg [31:0] INS_OUT
);

    always @ (posedge clk) begin
        if ( INS ) INS_OUT <= INS;
        else INS_OUT <= 32'd0;
    end

endmodule // pc
