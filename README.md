Flip-Flops in Verilog

Overview

In this project, I implemented three types of flip-flops—D, JK, and T Flip-Flops—in Verilog using behavioral modeling. My goal was to create circuits that store and manipulate single-bit data based on clock edges, with each flip-flop serving a unique purpose: the D Flip-Flop captures input data, the JK Flip-Flop supports multiple state transitions, and the T Flip-Flop toggles its state. I designed each flip-flop with a clock, reset, and specific inputs, and wrote testbenches to verify their functionality by applying various input sequences. I confirmed the designs work as expected through simulation.

Module: d_flipflop





What I Did: I designed a D Flip-Flop to store a single-bit input on the rising clock edge.



Inputs:





clk: Clock signal (positive edge-triggered).



reset: Synchronous reset to clear the output.



Din: Data input bit.



Outputs:





Q: Stored output bit.



Qbar: Complementary output bit.



How It Works:





On the rising edge of clk, if reset=1, I set Q=0 and Qbar=1.



If reset=0, I set Q=Din and Qbar=~Din, capturing the input data.



For example, if Din=1 and reset=0, then Q=1 and Qbar=0 after the clock edge.



Style: Behavioral modeling with an always @(posedge clk) block.

Module: JK_flipflop





What I Did: I designed a JK Flip-Flop to support flexible state transitions based on J and K inputs.



Inputs:





clk: Clock signal (positive edge-triggered).



reset: Synchronous reset to clear the output.



J: Input to set or toggle the output.



K: Input to clear or toggle the output.



Outputs:





Q: Stored output bit.



Qbar: Complementary output bit.



How It Works:





On the rising edge of clk, if reset=1, I set Q=0 and Qbar=1.



If reset=0, I used a case statement to handle {J,K}:





00: Q and Qbar remain unchanged (Q=Q, Qbar=Qbar).



01: Q=0, Qbar=1 (clear).



10: Q=1, Qbar=0 (set).



11: Q=~Q, Qbar=~Qbar (toggle).



For example, if J=1, K=1, and Q=0, then Q=1 and Qbar=0 after the clock edge.



Style: Behavioral modeling with an always @(posedge clk) block and a case statement.

Module: T_flipflop





What I Did: I designed a T Flip-Flop to toggle its state based on the T input.



Inputs:





clk: Clock signal (positive edge-triggered).



reset: Synchronous reset to clear the output.



T: Toggle input bit.



Outputs:





Q: Stored output bit.



Qbar: Complementary output bit.



How It Works:





On the rising edge of clk, if reset=1, I set Q=0 and Qbar=1.



If reset=0, I set Q=~Q and Qbar=~Qbar, toggling the state regardless of T.



Note: The provided code toggles on every clock edge when reset=0, ignoring T. This may be a design choice or error; a typical T Flip-Flop toggles only when T=1.



For example, if Q=0, then Q=1 and Qbar=0 after the clock edge, regardless of T.



Style: Behavioral modeling with an always @(posedge clk) block.

Testbenches





D Flip-Flop Testbench (testbench):





What I Did: I created a testbench to verify the D Flip-Flop.



How It Works:





I defined clk, reset, and Din as inputs, and Q, Qbar as outputs.



I generated a clock with a 10ns period (#5 clk=~clk).



I applied: reset=1, Din=1 for 10ns; then reset=0, Din=0 for 10ns.



I used $monitor to display clk, reset, Din, Q, and Qbar.



Purpose: The testbench verifies the D Flip-Flop captures Din correctly and resets to Q=0, Qbar=1.



JK Flip-Flop Testbench (testbench_JK):





What I Did: I created a testbench to verify the JK Flip-Flop.



How It Works:





I defined clk, reset, J, and K as inputs, and Q, Qbar as outputs.



I generated a clock with a 10ns period (#5 clk=~clk).



I applied: reset=1, J=1, K=0 for 10ns; then reset=0 and sequences J=0, K=1 (twice), and J=1, K=1 for 10ns each.



I used $monitor to display clk, reset, J, K, Q, and Qbar.



Purpose: The testbench verifies set, clear, and toggle operations of the JK Flip-Flop.



T Flip-Flop Testbench (T_testbench):





What I Did: I created a testbench to verify the T Flip-Flop.



How It Works:





I defined clk, reset, and T as inputs, and Q, Qbar as outputs.



I generated a clock with a 10ns period (#5 clk=~clk).



I applied reset=1, then repeated 10 cycles of T=0 for 10ns and T=1 for 10ns with reset=0.



I used $monitor to display clk, reset, T, Q, and Qbar.



Purpose: The testbench verifies the T Flip-Flop’s behavior, though it toggles every clock edge due to the code’s design.



Time Scale: All testbenches use 1ns / 1ps for precise simulation timing.

Files





d_flipflop.v: Verilog module for the D Flip-Flop and its testbench.



JK_flipflop.v: Verilog module for the JK Flip-Flop and its testbench.



T_flipflop.v: Verilog module for the T Flip-Flop and its testbench.

Circuit Diagram

Below are the circuit diagrams for the D, JK, and T Flip-Flops.

D flip flop

![hq720](https://github.com/user-attachments/assets/1aceb389-ce14-421a-845e-b83845894634)

JK flip flop

![JK-FLip-Flop-symbol-and-truth-table_negative](https://github.com/user-attachments/assets/941a218d-e790-4f01-8f54-4892d8b20fad)

T flipflop

![images](https://github.com/user-attachments/assets/b53a09ae-bb73-4a51-ae8b-d5b0f39c1547)




Simulation Waveform

Below is the simulation waveform for the D, JK, and T Flip-Flops, showing inputs and outputs over time.

![Screenshot 2025-06-11 175456](https://github.com/user-attachments/assets/69bb4b66-0779-4e92-ae46-68ef327753b5)



![Screenshot 2025-06-11 183935](https://github.com/user-attachments/assets/0ae8f082-20ac-44f4-bfda-fa253c78f9f0)




![Screenshot 2025-06-11 185927](https://github.com/user-attachments/assets/caf850c7-e1cf-4eaf-9013-41f1393bff6a)


Console Output

Below is the console output from my testbench simulations.



![Screenshot 2025-06-11 175654](https://github.com/user-attachments/assets/5d4ec782-b787-4376-b14c-c43088303a49)






D Flip-Flop:





clk=0 reset=1 Din=1 Q=0 Qbar=1



clk=1 reset=1 Din=1 Q=0 Qbar=1



clk=0 reset=0 Din=0 Q=0 Qbar=1



clk=1 reset=0 Din=0 Q=0 Qbar=1



JK Flip-Flop:


![Screenshot 2025-06-11 183954](https://github.com/user-attachments/assets/703ca26c-5fe7-4cdb-b3ca-ce82409445c9)



clk=0 reset=1 J=1 K=0 Q=0 Qbar=1



clk=1 reset=1 J=1 K=0 Q=0 Qbar=1



clk=0 reset=0 J=1 K=0 Q=1 Qbar=0



clk=1 reset=0 J=0 K=1 Q=0 Qbar=1



clk=1 reset=0 J=1 K=1 Q=1 Qbar=0



T Flip-Flop (example for one cycle):


![Screenshot 2025-06-11 185947](https://github.com/user-attachments/assets/9554e708-f390-4265-878d-108e146ea147)



clk=0 reset=1 T=0 Q=0 Qbar=1



clk=1 reset=0 T=0 Q=1 Qbar=0



clk=1 reset=0 T=1 Q=0 Qbar=1



... (continues for 10 cycles)
