# Computer Architecture: Lab

Computer Architecture, National Taiwan University, Spring 2023, Lab

Single-cycle RISC-V CPU implemented with Verilog

## Introduction

In this project, a single-cycle RISC-V CPU is implemented with Verilog. This project was developed as Lab 1 for the course Computer Architecture at National Taiwan University.

Modules provided directly by TAs: `Instruction_Memory.v`, `PC.v`, `Registers.v`, `testbench.v`, `functions.vh`, `instruction.txt` \
Modules implemented by me (following TAs' design specifications): `Adder.v`, `ALU_Control.v`, `ALU.v`, `Control.v`, `CPU.v`, `MUX32.v`, `Sign_Extend.v`

## Execution Guide

To compile and run the project, follow the steps:

```
$ cd codes
$ iverilog -o CPU.out *.v
$ vvp CPU.out
```

This will generate `output.txt`, which contains the program counter (PC) values and corresponding registers states at specific points during the execution of the program. 

## Environment

OS: MacOS

Compiler: Icarus Verilog (iverilog)