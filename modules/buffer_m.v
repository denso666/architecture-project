module buffer_m (
    input clk,
    input [2:0] in,
    output reg [2:0] out
);

    always @ (posedge clk) begin
        out = in; 
    end

endmodule // buffer_m
