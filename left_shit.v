module left_shift(input [63:0]imm_gen,output [63:0]adder2_input);

assign adder2_input = imm_gen<<1;

endmodule

