
# Synchronous_FIFO Design using SystemVerilog

## Project Overview

This project focuses on the RTL design and verification of a parameterized Synchronous FIFO (First-In First-Out) using SystemVerilog.

A FIFO is a sequential storage structure that follows the First-In First-Out principle, where the first data written is the first data read.

The design uses a common clock for both read and write operations.

## Design Specifications

| Parameter     | Default Value |
|---------------|---------------|
| Data Width    | 8 bits        |
| FIFO Depth    | 8 entries     |
| Address Width | 3 bits        |
| Count Width   | 4 bits        |

## Features

- Parameterized data width and FIFO depth
- Synchronous active-high reset
- Independent read and write enable signals
- Full and empty status flags
- Read and write pointer management
- FIFO occupancy tracking
- Explicit pointer wraparound
- Registered data output

## Tools Used

- SystemVerilog
- AMD Xilinx Vivado
- ModelSim (Free Edition)

## Repository Structure

```text
Synchronous_FIFO/
├── Synchronous_FIFO.srcs/
│   ├── sources_1/
│   │   └── new/
│   │       └── sync_fifo.sv
│   └── sim_1/
│       └── new/
│           └── tb_sync_fifo.sv
├── .gitignore
├── README.md
└── Synchronous_FIFO.xpr
```

## Project Progress

### RTL Design
- [x] Initial RTL implementation
- [x] Initial syntax correction
- [x] RTL elaboration
- [x] RTL synthesis

### Functional Verification
- [x] Basic testbench development
- [x] Single write and read operation
- [x] Reset verification
- [x] Empty and full flag verification after write/read
- [x] Read data integrity check
- [ ] Multiple transaction and FIFO ordering tests
- [ ] Full and empty boundary tests
- [ ] Overflow and underflow tests
- [ ] Simultaneous read/write tests
- [ ] Pointer wraparound tests
- [ ] Assertions and functional coverage

### Synthesis and Resource Analysis
- [x] Synthesis execution
- [x] Initial resource utilization analysis
- [x] Memory inference inspection

## Initial Synthesis Results

The design was synthesized using Vivado for the Xilinx Virtex-7 target device.

| Resource | Utilization |
|----------|-------------|
| Slice LUTs | 19 |
| Slice Registers | 18 |
| Block RAM Tiles | 0 |
| Bonded IOB | 22 |
| BUFGCTRL | 1 |

The small FIFO memory was implemented using distributed RAM resources rather than Block RAM.

## Future Work

The project will be extended with more comprehensive functional verification, corner-case testing, assertions, coverage analysis, and further synthesis analysis.

---

*This repository documents the RTL design, verification process, and synthesis results as the project develops.*
