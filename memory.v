module mem(input [63:0] Data, input [3:0] Addr, output [63:0] Dataout);
  reg[63:0] memory [0:3];
  always@(*)
    Dataout = memory[Addr];
endmodule
  
