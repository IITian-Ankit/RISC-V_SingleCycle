# Single-Cycle RISC-V Processor

This project is a comprehensive implementation of a single-cycle RISC-V processor designed and simulated using Verilog HDL. It demonstrates the fundamental architecture and working of a simplified RISC-V CPU, focusing on instruction execution in a single clock cycle.

---

## 🚀 Project Overview

This project aims to build a fully functional single-cycle RISC-V processor that supports the RV32I instruction set architecture. The design covers all key components, including:

- Instruction Fetch and Decode  
- Register File  
- ALU with arithmetic and logic operations  
- Control Unit for generating control signals  
- Immediate Generation and Sign Extension  
- Data Memory Access  
- Program Counter Update Logic

The processor executes each instruction in one clock cycle, illustrating the basic principles of RISC-V architecture and hardware design.

---

## 📂 Repository Structure

- `src/` — Contains all Verilog source files including modules for ALU, Register File, Control Unit, Instruction Memory, Data Memory, and the top-level processor module.
- `testbench/` — Testbench files for simulation and verification of the processor's functionality.
- `memfile.hex` — Sample instruction memory file for running programs on the processor.
- `README.md` — This document.

---
---

## 📷 Image References

- Design Diagram: -  https://github.com/IITian-Ankit/RISC-V_SingleCycle/blob/main/Design_and_Simulation_Images/Design%20of%20ISA.png
- Simulation Waveform: https://github.com/IITian-Ankit/RISC-V_SingleCycle/blob/main/Design_and_Simulation_Images/Simulation_Image.png
   Captured using GTKWave during simulation with Icarus Verilog.

If you use or share these images, please credit accordingly.

## 💡 Features

- **Supports RV32I Instruction Set:** Implements key RISC-V instructions including arithmetic, logic, load/store, and branch instructions.  
- **Single-Cycle Design:** Executes each instruction within one clock cycle, emphasizing simplicity and clarity.  
- **Modular Verilog Code:** Clean and well-structured HDL code for easy understanding and modification.  
- **Simulation Ready:** Includes simulation files with waveform snapshots to verify correct operation.  

---

## 📋 Instruction Set Architecture (ISA) Covered

| Instruction Type | Examples                  | Description                        |
|------------------|---------------------------|----------------------------------|
| R-Type           | add, sub, and, or, slt    | Register-register operations     |
| I-Type           | addi, lw, jalr            | Immediate and load instructions  |
| S-Type           | sw                        | Store instructions               |
| B-Type           | beq, bne                  | Conditional branches             |

---

## 🛠️ Tools Used

- VS Code - For writing the verilog code
- Icarus Verilog (iverilog) — Verilog compiler and simulator  
- GTKWave — Waveform viewer for simulation results  

---

## 📚 References

- Digital Design and Computer Architecture: RISC-V Edition by Sarah L. Harris and David Harris  
- Various open-source RISC-V projects and tutorials for guidance

---

## 🙏 Acknowledgments

Thanks to the RISC-V community and the open-source contributors whose resources made this project possible.

---

## 📞 Contact

Feel free to reach out for questions, suggestions, or collaborations!  
**Ankit Ghanshyam Choudhary**  
[GitHub Profile](https://github.com/IITian-Ankit)  
[Gmail] (ankit.ghanshyam.23042@iitgoa.ac.in)

---

*This project is open for improvements and contributions. Pull requests and issues are welcome!*
