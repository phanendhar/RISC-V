module reg_file #(parameter ADDR_SIZE=5,WORD_SIZE=64) (clk,rst,RegWrite,source_reg1,source_reg2,wr_add,wr_data,source1_read,source2_read);
  
  input clk,rst,RegWrite;
  input [ADDR_SIZE-1:0] source_reg1,source_reg2,wr_add;
  input [WORD_SIZE-1:0] wr_data;
  output [WORD_SIZE-1:0] source1_read,source2_read;
  
  parameter depth = 1<<ADDR_SIZE;
  
  reg[WORD_SIZE-1:0] mem [depth-1:0];
  
  always@(posedge clk)
    
   if(!rst)
      for(int i=0; i<(1<<ADDR_SIZE);i=i+1)
        begin
          mem[i] <= 0;
        end
  else
    begin
      if(RegWrite)
        mem[wr_add] <= wr_data;
      else
        mem[wr_add] <= mem[wr_add];
    end
  
  assign source1_read = mem[source_reg1];
  assign source2_read = mem[source_reg2];
  
endmodule
  
