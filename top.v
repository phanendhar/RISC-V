`include "pc.v"
`include "adder1.v"
`include "adder2.v"
`include "left_shit.v"
`include "mux1.v"

module top();
reg [63:0]imm_gen;
reg and_out,rst;
wire [63:0]pctoadder,adder1tomux,shifttoadder2,adder2tomux,muxtopc;
pc dut1(muxtopc,pctoadder);
adder1 dut2(pctoadder,adder1tomux);
left_shift dut3(imm_gen,shifttoadder2);
adder2 dut4(pctoadder,shifttoadder2,adder2tomux);
mux1 dut5(adder1tomux,adder2tomux,and_out,rst,muxtopc);

initial
begin
imm_gen = 64'hffff_8097_0001_2323;
and_out = 1'b0;
rst = 1'b1;
#5;
imm_gen = 64'hacca_9090_8881_0456;
and_out = 1'b1;
rst = 1'b0;
#100;

$finish;
end


initial
$monitor($time,"muxtop=%d,adder1tomux=%d,adder2tomux=%d,leftshift=%d",muxtopc,adder1tomux,adder2tomux,shifttoadder2); 

endmodule


