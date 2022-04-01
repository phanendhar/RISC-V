module adder1(input [63:0]pc_output, output [63:0]mux_input);

assign mux_input = pc_output+4;

endmodule
