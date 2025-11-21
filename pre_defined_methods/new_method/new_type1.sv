
//--> empty new method

class sample;
	rand int a,b;

	function void print();
		$display("a=%0d | b=%0d",a,b);
	endfunction

	function new();
		$display("--> new method is happend");
	endfunction
endclass

module top;
	sample s;
	initial begin
		s=new();
		s.randomize();
		s.print();
	end
endmodule

/* Output:-
# --> new method is happend
# a=-770586142 | b=-455241336
*/
