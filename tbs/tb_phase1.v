module test_bench;

	reg clk = 1;
	single_dp duv( clk );

	always #100 clk = ~clk;

	initial begin
		$dumpfile("phase1.vcd");
      	$dumpvars(0, test_bench);

      	#5000 $finish;
	end

endmodule
