`timescale 1us / 1ns

module tbsinewave();

reg clk;
reg reset;

reg [31:0]cnt;
reg cnt_edge;
reg signed [15:0]sin_val;

integer freq = 0;
real my_time = 0;
real sin_real = 0;
sin_val = 16'b0000000000000000; 


sinewave sin1(.clk(clk), .reset(reset), .cnt(cnt), .cnt_edge(cnt_edge), .sin_val(sin_val));
// sinewave sin1(clk, reset, cnt, cnt_edge, sin_val);


initial clk=0;
always
  #0.05 clk = ~clk;

//make reset signal at begin of simulation

initial
begin
  reset = 1;
  #0.1;
  reset = 0;
//end

//initial
//begin
  $dumpfile("out.vcd");
  $dumpvars(0,tbsinewave);
  my_time=0;
  
  freq=500;

  $finish;
end
endmodule
