//--> Unpack Method
class eth_pkt;
	rand bit[55:0]preamble;
	rand bit[7:0]sof;
	rand bit[47:0]sa;
	rand bit[47:0]da;
	rand bit[15:0]len;
		 bit[31:0]crc;
	rand byte payload[$];

	//--> Print Method
	function void print(string str="Eth_Pkt");
		$display("-------> %0s <-------",str);
		$display("preamble=%0d",preamble);
		$display("sof=%0d",sof);
		$display("sa=%0d",sa);
		$display("da=%0d",da);
		$display("len=%0d",len);
		$display("crc=%0d",crc);
		$display("payload=%p",payload);
	endfunction

	//--> Pack Method
	function void pack(input eth_pkt p,output byte que[$]);
		que = {<<byte{p.preamble,p.sof,p.sa,p.da,p.len,p.crc,p.payload}};
	endfunction

	//--> Unpack Method
	function void unpack(input byte que[$], output eth_pkt p);
		p = new();
		{<<byte{p.preamble,p.sof,p.sa,p.da,p.len,p.crc,p.payload}}=que;
	endfunction

	constraint l_c{
		len inside {[10:15]};
		payload.size()==len;
	}
endclass

module top;
	eth_pkt pkt,pkt2;
	byte queue[$];
	initial begin
		pkt = new();
		pkt.randomize();
		pkt.print();
		pkt.pack(pkt,queue);
		$display("----------------------------------------------------------------------------");
		$display("Packed Queue :- %p",queue);
		$display("----------------------------------------------------------------------------");
		pkt.unpack(queue,pkt2);
		pkt2.print("Un packed Eth_Pkt");
		
	end
endmodule

/* Output:-
# -------> Eth_Pkt <-------
# preamble=14906476018882073
# sof=251
# sa=210838264658979
# da=197270863703325
# len=11
# crc=0
# payload='{-51, -99, -18, -71, -68, -58, 20, 120, 111, 37, 31}
# ----------------------------------------------------------------------------
# Packed Queue :- '{31, 37, 111, 120, 20, -58, -68, -71, -18, -99, -51, 0, 0, 0, 0, 11, 0, 29, 109, -63, -77, 106, -77, 35, -68, -34, -101, -63, -65, -5, 25, 86, -11, 103, 92, -11, 52}
# ----------------------------------------------------------------------------
# -------> Un packed Eth_Pkt <-------
# preamble=14906476018882073
# sof=251
# sa=210838264658979
# da=197270863703325
# len=11
# crc=0
# payload='{-51, -99, -18, -71, -68, -58, 20, 120, 111, 37, 31}
*/
