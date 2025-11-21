//--> passing arguments through new method

class sample;
	rand int a,b;

	function void print(string str="randomized");
		$display("---> %0s <---",str);
		$display("a=%0d | b=%0d",a,b);
	endfunction

	function new(input int x,y);
		a=x;
		b=y;
	endfunction
endclass

module top;
	sample s;
	initial begin
		s=new(10,20);
		s.print("Before Randomize");
		s.randomize();
		s.print("After Randomize");
	end
endmodule

/* Output:-
# ---> Before Randomize <---
# a=10 | b=20
# ---> After Randomize <---
# a=-770586142 | b=-455241336
*/
