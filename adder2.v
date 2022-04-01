module adder2(input [63:0]pc_out2,shift_out, output [63:0]mux_in2);

assign mux_in2 = pc_out2 + shift_out;

endmodule
