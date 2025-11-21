//--> passing default values through new method

class sample;
	rand int a,b;

	function void print(string str="randomized");
		$display("---> %0s <---",str);
		$display("a=%0d | b=%0d",a,b);
	endfunction

	function new(input int x=500,y=1000);
		a=x;
		b=y;
	endfunction
endclass

module top;
	sample s;
	initial begin
		s=new();
		s.print("default values");
		s=new(4514);
		s.print("passing a value through argument and b as default");
	end
endmodule

/* Output:-
# ---> default values <---
# a=500 | b=1000
# ---> passing a value through argument and b as default <---
# a=4514 | b=1000
*/
