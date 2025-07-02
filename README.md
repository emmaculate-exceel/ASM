# ASSEMBLY

---


# 🧠 Assembly Lab – Low-Level Magic Unleashed

Welcome to **Assembly Lab** – a deep dive into the world where hardware meets code! This repository is a personal playground and educational archive for learning and experimenting with Assembly Language. Whether you're a fellow explorer of the silicon depths or just Assembly-curious, you're in the right place.

## 🛠️ What's Inside?

This repo contains:

- 📄 Clean, commented assembly source files
- 🧪 Mini-projects demonstrating core concepts
- 💡 Well-documented examples for:
  - Register manipulation
  - System calls
  - Loops & branching
  - Arithmetic operations
  - Memory management
  - BIOS/UEFI interaction (if applicable)

## 🚀 Getting Started

Want to run the code on your machine? Here's what you need:

### ✅ Prerequisites

- A working x86 or x86_64 system (or emulator)
- [NASM](https://www.nasm.us/) – Netwide Assembler
- [QEMU](https://www.qemu.org/) or similar for bare metal projects (optional)
- A Linux environment (WSL, VM, or native preferred)

### 🧪 How to Assemble and Run

```bash
nasm -f elf64 hello.asm -o hello.o
ld hello.o -o hello
./hello


assembly-lab/
├── basics/          # Hello world, registers, simple math
├── loops/           # Iteration and control flow
├── system_calls/    # Interfacing with OS
├── bootloader/      # Boot sector experiments (if included)
├── docs/            # Cheatsheets and notes
└── README.md

---
### Basic Components of assembly


- Instructions : which tells the computer what action or instruction to perform

- Operands : which specifies the data the instruction will work on

- Mnemonics : Is what assembly uses which human readable abbreviations

- Register : And Each instructions operates on registers which are small fast storage areas inside the CPU where data is temporarily held or stored during operations

---


#### CPU Registers

- cpu registers are small high speed storage location within the processor that hold data and instructions temporarily during computation , they play a crucial in the execution of programs as they provide the fastest means for cpu to access and manipulate data.

there are different kind of register each designed for specific purposes.

- General-purpose register : which can hold data for various operations
- Special-purpose register : which holds the current instruction being executed and program counter which keeps track of the address of the next instruction
- Status Register : Which maintain information about the current state of the CPU including flags for arithmetic operations

#### Flags in assembly


Flags are special bit in the CPU that stores result of operations and help control the flow of a program the status flag are updated automatically based on the outcome of instructions and are used to make decisions during execution.

      * Zero flag(ZF) : is set when the result of an operation is Zero
      * Carry flag(CF) : is set when the result of an arithmetic operation produces a result too large for the register to hold
      * Overflow flag(OF) : tracks whether an arithmetic operation results in overflow
      * Sign flag (SF) : Indicates whether a result is negative .

---

#### Memory and addressing Modes
memory and addressing mode are key concept in assembly language that help us understand how data is stored and accessed in a computers memory. 

- Memory : is referred to the physical location of where data is kept allowing programs to retrieve and manipulate information or data.

- Addressing : is defined as the different ways we can access these memory determining how the cpu interpretes the addresses and instructions .
             ##### Types of addressing
                   - Immediate addressing : ADD R1, 5
                   - Direct addressing : ADD R1, [1000]
                   - Indirect addressing : ADD R1, [R2]


---

### Basic Assembly Instructions

- Arithmetic Instruction : performs mathematical operations
             * ADD R1, R2
             * SUB R1, R2
             * MUL R1, R2
             * DIV R1, R2
- Logic Instructions : performs Bitwise operations
             * AND R1, R2
             * OR  R1, R2
             * XOR R1, R2
             * NOT R1, R2
- Control Instructios : Directs program flow
             * JMP LABEL : jump to a specific label in the code 
             * CMP R1, R2 : compares the R1 to R2
             * JE LABEL : jump if equals jump
             * JNE LABEL : jump if not equals jump

- Data Movement Instructions : transfers datas
             * MOV R1, R2
             * PUSH R1
             * POP R1
             * SHL R1, 1 : multiplying the value by 2
             * SHR R1, 1 : dividing the value by 2
             * ROL R1, 1 : rotate left
             * ROR R1, 1 : rotate right

---

### How assembly is executed

Assembly language is executed through a process known as Fetch-Decode-Execute lifecycle.

         - During the fetch phase the cpu receives an instruction from memory typically pointed to by the program counter .