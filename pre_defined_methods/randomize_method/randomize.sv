//--> Randomize() method

class sample;
	rand int a,b;

	function void print(string str="Default case");
		$display("------> %0s <----------",str);
		$display("a=%0d | b=%0d",a,b);
	endfunction

	function void pre_randomize();
		$display("pre_randomize is happened");
		b.rand_mode(0);
		a_c.constraint_mode(0);
	endfunction
	function void post_randomize();
		$display("post_randomize is happened");
		b=105502;
	endfunction

	constraint a_c{
		a inside {[10:100]};
	}
endclass

module top;
	sample s;
	initial begin
		s = new();
		s.print();
		s.randomize();
		s.print("After Randomize");
	end
endmodule

/* Output:-
# ------> Default case <----------
# a=0 | b=0
# pre_randomize is happened
# post_randomize is happened
# ------> After Randomize <----------
# a=-770586142 | b=105502
*/
