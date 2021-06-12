module ins_mem (
    input [31:0] ADDR,
    output [31:0] INS
);
    reg [7:0] mem [0:399];

    initial $readmemb ("mem/instructions2.mem", mem);

    assign INS = { mem[ADDR], mem[ADDR+1], mem[ADDR+2], mem[ADDR+3] };

endmodule
