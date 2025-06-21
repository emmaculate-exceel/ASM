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
