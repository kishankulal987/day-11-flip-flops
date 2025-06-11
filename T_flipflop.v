`timescale 1ns / 1ps

module T_flipflop(input clk,reset,T,output reg Q,Qbar);
always @(posedge clk)
begin
if(reset)
begin
Q<=0;
Qbar<=1;
end
else begin
Q<=~Q;
Qbar<=~Qbar;
end
end
endmodule

module T_testbench;
reg clk,reset,T;
wire Q,Qbar;
T_flipflop m1(clk,reset,T,Q,Qbar);
initial clk=0;
always #5 clk=~clk;
initial begin
$monitor("clk=%d reset=%b T=%b Q=%b Qbar=%b", clk,reset,T,Q,Qbar);
reset=1;
repeat(10)
begin
T=0;
#10 reset=0;
T=1;
#10;
end
$finish;
end
endmodule
