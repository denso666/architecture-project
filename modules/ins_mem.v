module ins_mem (
    input [31:0] ADDR,
    output reg [31:0] INS
);
    reg [7:0] mem [0:399];

    initial $readmemb ("mem/instructions.mem", mem);

    always @( ADDR ) begin
        INS = { mem[ADDR], mem[ADDR+1], mem[ADDR+2], mem[ADDR+3] };

        // only for testing
        //$display("INS: %b; ADDR: %d", INS, ADDR);
    end
endmodule
