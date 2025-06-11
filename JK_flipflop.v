`timescale 1ns / 1ps


module JK_flipflop(input clk,reset,J,K,output reg Q,Qbar);
always @(posedge clk)
begin
if(reset)
begin
Q<=0;
Qbar<=1;
end
else begin
case({J,K})
2'b00: begin
       Q<=Q;
       Qbar<=Qbar;
       end
2'b01:begin
      Q<=0;
      Qbar<=1;
      end
2'b10:begin
      Q<=1;
      Qbar<=0;
      end
2'b11:begin
      Q<=~Q;
      Qbar<=~Qbar;
      end
endcase
end
end
endmodule


module testbench_JK();
reg clk,reset,J,K;
wire Q,Qbar;
JK_flipflop m1(clk,reset,J,K,Q,Qbar);
initial clk=0;
always #5 clk=~clk;
initial begin
$monitor("clk=%d reset=%b J=%b K=%b Q=%b Qbar=%b", clk,reset,J,K,Q,Qbar);
reset=1;
J=1;K=0;
#10 reset=0;
#10 J=0;K=1;
#10 J=0;K=1;
#10 J=1;K=1;
#10;
$finish;
end
endmodule