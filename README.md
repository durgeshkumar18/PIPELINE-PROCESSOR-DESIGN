# 4-Stage Pipelined Processor - CODTECH Internship Project

## Project Title
**Design a 4-Stage Pipelined Processor with Basic Instructions**

## Internship: CODTECH IT Solutions  
**Task:** Build a simple pipelined processor using Verilog HDL that supports basic instructions like `ADD`, `SUB`, and `LOAD`.

---

## Overview

This project implements a 4-stage pipelined processor using Verilog HDL. The processor supports a simple instruction format and includes the following stages:

1. **Instruction Fetch (IF)**
2. **Instruction Decode (ID)**
3. **Execute (EX)**
4. **Memory/Write-back (MEM)**

---

## Instruction Format

- 16-bit instruction:  
  `[15:12]` - Opcode  
  `[11:8]`  - Destination Register  
  `[7:4]`   - Source Register 1  
  `[3:0]`   - Source Register 2 or Memory Address  

| Opcode | Operation |
|--------|-----------|
| 0001   | ADD       |
| 0010   | SUB       |
| 0011   | LOAD      |

---

## Pipeline Registers Used

- `IF_ID`: Holds fetched instruction.
- `ID_EX`: Holds decoded instruction and operand values.
- `EX_MEM_val`: Result of ALU operation or loaded data.
- `EX_MEM_rd`: Destination register.
- `EX_MEM_opcode`: Instruction opcode for write-back.

---

## Simulation Testbench

The testbench initializes the processor with three instructions:
1. `ADD R1, R2, R3`  
2. `SUB R4, R2, R3`  
3. `LOAD R5, [6]`  

Registers and data memory are preloaded with values to verify correct pipeline behavior.

---

## Sample Output

After simulation:
- **R1 = 15** (10 + 5)
- **R4 = 5**  (10 - 5)
- **R5 = 25** (value from memory address 6)

---

## Files Included

- `pipelined_processor.v` - Verilog source code for the processor
- `tb_pipelined_processor.v` - Testbench
- `README.md` - Project documentation

---

## How to Simulate

1. Open ModelSim/GTKWave/Vivado or any Verilog simulator.
2. Compile both files.
3. Run simulation.
4. View register outputs and waveform.

---

## Conclusion

This project demonstrates a basic pipelined CPU architecture and enhances understanding of instruction-level parallelism using Verilog HDL.

**Completion Certificate** will be issued at the end of the internship.

---# PIPELINE-PROCESSOR-DESIGN
