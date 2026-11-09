Design and Verification of a 32-bit RISC-V Single-Cycle Processor

1. Project Overview
   
This project focuses on the design and verification of a 32-bit RISC-V Single-Cycle Processor using Verilog HDL.
The processor is designed using modular RTL architecture. Each module performs a specific function, and all modules are integrated to execute RISC-V instructions.
The design is developed, simulated and synthesised using Xilinx Vivado 2025.2.

2. Project Objectives

- Understand the architecture of a 32-bit RISC-V processor.
- Design individual processor modules using Verilog HDL.
- Integrate all modules into a complete processor.
- Execute different RISC-V instructions.
- Verify individual modules using testbenches.
- Analyse simulation waveforms.
- Evaluate FPGA resource utilisation through synthesis.

3. Processor Architecture
   
The processor consists of the following major modules:

1. Program Counter (PC)
2. Instruction Memory
3. Control Unit
4. Register File
5. Immediate Generator
6. Arithmetic Logic Unit (ALU)
7. PC + 4 Adder
8. Data Memory
9. Top-Level Processor



4.Supported Instructions

Instruction Type| Instructions
I-Type| ADDI
R-Type| ADD, SUB, AND, OR, XOR, SLT
S-Type| SW
I-Type (Load)| LW
B-Type| BEQ, BNE
J-Type| JAL

5. RTL Design Modules

Module| Function
riscv_top.v| Top-level processor integration
p_c.v| Program Counter
inst_memory.v| Instruction Memory
control_unit.v| Generates control signals
regfile.v| Register File
imm_gen.v| Immediate Generator
alu.v| Arithmetic Logic Unit
adder.v| PC + 4 Adder
data_mem.v| Data Memory

6. Verification and Simulation

- Individual RTL modules are verified using separate testbenches.
- Top-level processor functionality is verified through simulation.
- Simulation waveforms are analysed using Vivado.
- Debug signals are used to observe processor execution.
- Instruction execution and module functionality are checked through simulation.

7. Synthesis Results

The RTL design is synthesised using Xilinx Vivado.

FPGA Target: xc7k70tfbv676-1

Resource| Used
Slice LUTs| 561
Slice Registers| 32
F7 Muxes| 64
F8 Muxes| 32
Bonded IOB| 130
BUFGCTRL| 1
Block RAM| 0
DSP| 0

Implementation Notes:

- Physical FPGA pin constraints have not been assigned.
- FPGA board implementation has not been completed.
- Timing closure has not been evaluated because timing constraints have not been defined.

8. Tools and Technologies

- Verilog HDL
- Xilinx Vivado 2025.2
- RTL Design
- Functional Simulation
- Testbench Verification
- FPGA Synthesis

9. Project Folder Structure

- RISC-V-32-bit-Single-Cycle-Processor/
  - rtl/
    - Verilog RTL design files
  - tb/
    - Individual module testbenches
  - docs/
    - Architecture diagram
    - Elaborated design schematic
    - Main simulation waveform
    - Utilization report
    - waveforms/
      - Individual module waveforms
  - README.md

10. Future Improvements

- Extend the processor to support additional RISC-V instructions.
- Improve verification using SystemVerilog Assertions.
- Develop a self-checking SystemVerilog testbench.
- Explore UVM-based verification.
- Perform physical implementation with appropriate FPGA constraints.

11. Conclusion

This project provides practical experience in 32-bit RISC-V processor architecture, RTL design, Verilog coding, functional verification, simulation and FPGA synthesis.

It builds a foundation in digital design and frontend VLSI engineering.
