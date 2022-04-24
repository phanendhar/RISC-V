module reg_file_tb();
  
  parameter ADDR_SIZE=5,WORD_SIZE=64;
  
  reg clk, rst, RegWrite;
  reg[ADDR_SIZE-1:0] source_reg1,source_reg2,wr_add;
  reg[WORD_SIZE-1:0] wr_data;
  wire [WORD_SIZE-1:0] source1_read,source2_read;
  
  reg_file #(5,64) dut(clk,rst,RegWrite,source_reg1,source_reg2,wr_add,wr_data,source1_read,source2_read);
  
  initial
    clk=0;
  always
    #5 clk=~clk;
  
  initial
    begin
     rst=0;
      RegWrite=1'b1;
      source_reg1=5'b00001;
      source_reg2=5'b00010;
     wr_add=5'b00001;
      wr_data=464;
      #10;
      rst=1;
      wr_add=5'b10001;
      wr_data = 433;
      #10;
      source_reg1=5'b10001;
      #10;
      $finish;
    end
  
  initial  $monitor($time,"rst=%b,reg1=%d,reg2=%d,wr_add=%d,wr_data=%d,source1_read=%d,source2_read=%d",rst,source_reg1,source_reg2,wr_add,wr_data,source1_read,source2_read);
  
endmodule
