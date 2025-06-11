`timescale 1ns / 1ps

module d_flipflop(input clk,reset,Din,output reg Q,Qbar);
always @(posedge clk)
begin
if(reset)
begin
Q<=0;
Qbar<=1;
end
else begin
Q<=Din;
Qbar<=~Din;
end
end
endmodule

module testbench();
reg clk,reset,Din;
wire Q,Qbar;
d_flipflop m1(clk,reset,Din,Q,Qbar);
initial clk=0;
always #5 clk=~clk;
initial begin
$monitor("clk=%d reset=%b Din=%b Q=%b Qbar=%b", clk,reset,Din,Q,Qbar);
reset=1;
Din=1;
#10 reset=0;
Din=0;
#10;
$finish;
end
endmodule

