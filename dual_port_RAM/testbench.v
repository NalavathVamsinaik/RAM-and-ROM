`timescale 1ns / 1ps


module dual_port_ram_tb();

reg [7:0] data_a, data_b;// input data
reg [5:0] addr_a, addr_b;// address location
reg clk;// clock
reg we_a, we_b;// write enable for port a and b
wire [7:0]q_a, q_b; // out put data

dual_port_ram dut(
.data_a(data_a),
.data_b(data_b),
.addr_a(addr_a),
.addr_b(addr_b),
.clk(clk),
.we_a(we_a),
.we_b(we_b),
.q_a(q_a),
.q_b(q_b)
);

always #5 clk=~clk;

initial  
  begin
  
   clk=0;
   we_a=1;
   we_b=1;
   
      data_a=8'h12;
      addr_a=6'h01;
      
      data_b=8'h15;
      addr_b=6'h02;
      
     #10;
     
       data_a=8'h33;
       addr_a=6'h03;
         
       data_b=8'h44;
       addr_b=6'h04;
       
    #10;
    
    we_a=0;
    
    addr_a=6'h01;
    addr_b=6'h02;
    
   #10;
   
   we_b=0;
   
   addr_a=6'h03;
   addr_b=6'h04;
   
#1000; $finish;

end 
   
     
endmodule
