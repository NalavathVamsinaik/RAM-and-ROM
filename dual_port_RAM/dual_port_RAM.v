`timescale 1ns / 1ps


module dual_port_ram(
  input [7:0]data_a, data_b, //input of dataa
  input [5:0]addr_a, addr_b, // Port a and port b address
  input  we_a,  // write enable for port a 
  input  we_b, // write enable for port b
  input clk,  //clcok
  output reg [7:0]q_a, //output data for port a 
  output reg [7:0]q_b //output data for  port b
);

reg [7:0] ram [63:0]; // 8*64 bit ram

always @(posedge clk)
  begin
     if (we_a)
       ram[addr_a]<=data_a;
     else
       q_a<=ram[addr_a];
  end
  
 always @(posedge clk)
   begin
     if (we_b)
      ram[addr_b]<=data_b;
     else
      q_b<=ram[addr_b];
     end
endmodule
