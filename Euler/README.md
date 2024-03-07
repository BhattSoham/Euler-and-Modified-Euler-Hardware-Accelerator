# Hardware Accelerator Design for Euler method using Xilinx Vivado and VHDL language #
The goal of this study is to implement the Euler and modified Euler method of numerical analysis in solving ordinary differential equations. The work has been specifically done using Very High-Speed Integrated Circuit Hardware Descriptive Language (VHDL) in Xilinx Vivado Software. The accelerator is typically deployed on the Zynq ZC702 FPGA Evaluation Kit.
The work has been accepted for the **IEEE CSCI 2023** conference.

At first, we have to create a file by going from "Project" to "New". Name the file according to your preference. Use it according to your requirements. We have used the Zynq ZC702 FPGA Evaluation Kit, as it has enough I/O pins, which are useful for deploying it on the FPGA.

The project was first integrated using Xilinx Floating Point IP support and we have used single precision (32-bit) floating point IP for implementing the HW accelerator.
It has to be used during the whole process of the work.

### EULER'S METHOD ###
Euler’s method is a first-order numerical procedure for solving ordinary differential equations (ODE) with a given initial value. Euler’s method uses the simple formula,

x<sub>n+1</sub> = x<sub>n</sub> + h;

y<sub>n+1</sub> = y<sub>n</sub> + hf(x<sub>n</sub>,y<sub>n</sub>)

We have chosen a simple ordinary differential equation to solve using Euler's method in this work. The equation is as follows:

𝑓 = 𝑥𝑦(𝑥 − 𝑦) / 2

**Implementation Details in Short**

At first, a functional block has been made using VHDL language in ![(Equation implementation)](/func.vhd). The code has utilized three IP Floating point units such as addition, subtraction, and multiplication. Thereafter, the functional block has been used to implement it using the Euler block in ![(Euler)](/Euler.vhd). The code has utilized two IP Floating point units as addition, and a MAC unit (multiplication-accumulator unit). The register file ![(reg file)](/reg.vhd), control unit ![(CU)](/CU.vhd), and memory unit ![(mem)](/Mem.vhd) have been designed. The accelerator will take some initial set of values of 𝑥<sub>𝑖𝑛</sub> and 𝑦<sub>𝑖𝑛</sub> as 2 and 1 respectively. The accelerator will work based on the custom instructions given to the control unit and the control unit will control all the other modules such as the memory unit, register file, and the Euler module. The accelerator will determine the iteration approximation result of the equation through 𝑥<sub>𝑛+1</sub> and 𝑦<sub>𝑛+1</sub>. The Top module ![(Top)](/Top.vhd) connects all the other components together. A test bench ![(Test Bench)](/Top_tb.vhd) is provided to demonstrate the ODE using the Euler method.

All the implementation designs will be disclosed in the **IEEE CSCI 2023** paper after it has been published!

***Experimental Results***

**On-Chip Power Consumption**

The Xilinx Vivado Power Analyzer tool has been used to determine the total on-chip power consumption for generating the result at a clock frequency of 2.85Mhz. 
The total on-chip power consumed by the hardware accelerator is 0.191W.

| Static Power  | Dynamic Power |
| ------------- | ------------- |
| 99%           | 1%            |

**FPGA Resources**

The specific hardware resource utilization of the hardware accelerator has been given below in terms of Look-up tables (LUT), Flip-Flops, DSP, input-output usages (I/O), and Buffers.

| Resources  | Percentage |
| ------------- | ------------- |
| BUFG          | 3%            |
| IO          | 71%            |
| DSP         | 5%            |
| FF           | 2%            |
| LUT           | 9%            |

**Timing Summary**

The timing summary is given below.

| Index                         |Delay(ns)      |
| ------------------------------| ------------- |
| Total Setup Time delay        | 6.832         |
| Total Hold Time Delay         | 2.705         |
| Worst Negative Slack          | 88.016        |
| Worst Hold Slack              | 0.165         |


In this study, the hardware accelerator for an ODE solver using the Euler method has been constructed. The Xilinx Vivado environment and the VHDL language were used for all of the work. According to the analysis, it has been observed that the Xilinx Vivado single precision floating point IP support improves the performance of the hardware accelerator significantly. Additionally, an analysis of the power estimation, hardware resource utilization, and timing summary reported in the article has been conducted. At the moment, this article plays a vital role in improving the finding's ability to run on other FPGA boards.
Future work on pipelining the architecture's process and incorporating the hardware accelerator into a system-on-chip (SOC) is interesting. Implementing
the work into a general-purpose RISC-V core and determining which offers the best performance at a specific clock speed might be another study topic.











