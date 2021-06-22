module test_bench;

	reg clk = 1;
	single_dp duv( clk );

	always #100 clk = ~clk;

	initial begin
		$dumpfile("wave.vcd");
      	$dumpvars(0, test_bench);

      	#5500 $finish;
	end

endmodule
