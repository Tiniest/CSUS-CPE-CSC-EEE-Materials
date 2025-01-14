module ExclusiveOrGate(in1, in2, out);
	input in1, in2;
	output out;
	
	wire in1, in2, out;
	wire notin1out, notin2out, and1out, and2out;
	
	or or1(out, and1out, and2out);
	
	and and1(and1out, in1, notin2out),
	and2(and2out, in2, notin1out);
	
	not notin1(notin1out, in1),
	notin2(notin2out, in2);
	
endmodule 