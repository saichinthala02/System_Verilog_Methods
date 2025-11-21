//--> passing values through new method

class sample;
	rand int a,b;

	function void print();
		$display("a=%0d | b=%0d",a,b);
	endfunction

	function new();
		a=100;
		b=1500;
	endfunction
endclass

module top;
	sample s;
	initial begin
		s=new();
		s.print();
		s.randomize();
		s.print();
	end
endmodule

/* Output:-
# a=100 | b=1500
# a=-770586142 | b=-455241336
*/
