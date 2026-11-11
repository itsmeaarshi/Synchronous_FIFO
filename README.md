# Synchronous\_FIFO Design using SystemVerilog





\## Project Overview



This project focuses on the RTL design and verification of a parameterized Synchronous FIFO (First-In First-Out) using SystemVerilog.



A FIFO is a sequential storage structure that follows the First-In First-Out principle, where the first data written is the first data read.



The design uses a common clock for both read and write operations.



\## Design Specifications



| Parameter     | Default Value |

|---------------|---------------|

| Data Width    | 8 bits        |

| FIFO Depth    | 8 entries     |

| Address Width | 3 bits        |

| Count Width   | 4 bits        |



\## Features



\- Parameterized data width and FIFO depth

\- Synchronous active-high reset

\- Independent read and write enable signals

\- Full and empty status flags

\- Read and write pointer management

\- FIFO occupancy tracking

\- Explicit pointer wraparound



\## Tools Used



\- SystemVerilog

\- AMD Xilinx Vivado

\- ModelSim (Free Edition)



\## Repository Structure



```text

Synchronous\_FIFO/

├── Synchronous\_FIFO.srcs/

│   └── sources\_1/

│       └── new/

│           └── sync\_fifo.sv

├── .gitignore

├── README.md

└── Synchronous\_FIFO.xpr

```



\## Project Progress



\- \[x] Initial RTL implementation

\- \[x] Initial syntax correction

\- \[ ] RTL compilation

\- \[ ] Testbench development

\- \[ ] Functional simulation

\- \[ ] Corner-case verification

\- \[ ] Assertions and coverage

\- \[ ] Synthesis and resource analysis



\## Future Work



The project will be extended with a self-checking testbench, functional verification, corner-case testing, and synthesis analysis.



\---



\*This repository documents the design and verification process as the project develops.\*

