module overflow_1b(cin, cout, sum, set, overflow);
	input cin, cout, sum;
	output set, overflow;
	
	xor xo1 (overflow, cin, cout);
	xor xo2 (set, sum, overflow);
endmodule