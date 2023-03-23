`timescale 1ns / 1ps



module single_port_ram_tb( );

reg [7:0]data;  // input data
reg [5:0]addr; // address
reg we; // write enable
reg clk; // clock
wire [7:0]q; // output data

single_port_ram dut (
.data(data),
.addr(addr),
.we(we),
.clk(clk),
.q(q)
);

always #5 clk=~clk;


initial 
  begin 
  
  clk=0;
  we=1;
  
  data=8'h01;
  addr=5'd1;
  
  #10;
  
  data=8'ha2;
  addr=5'd2;
  
  #10;
  
  data=8'hb3;
  addr=5'd3;
  
  #10;
  
  we=0;
  
  addr=5'd2;
  #10;
  
  addr=5'd1;
  #10;
  
  we=1;
  
  data=8'hdf;
  addr=6'd50;
  
  #10;
  
  data=8'hbf;
  addr=6'd51;
  
  #10;
  
  we=0;
  
  addr=6'd50;
  
  
#1000; $finish;

end 

endmodule
