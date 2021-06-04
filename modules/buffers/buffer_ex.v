module buffer_ex (
    input clk,
    input [4:0] in,
    output reg [4:0] out
);

    always @ (posedge clk) begin
        out = in;
    end

endmodule // buffer_ex
