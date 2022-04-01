module mux1(input [63:0]adder1_out,adder2_out,input and_out,rst, output reg[63:0]pc_in);

always@(*)

begin
if(rst)
pc_in=0;
else
begin
if(!and_out)
pc_in = adder1_out;
else
pc_in = adder2_out;
end
end

endmodule


