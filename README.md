Montgomery Modular Multiplication - Side-Channel Resistant Implementation

This project implements Montgomery Modular Multiplication (MMM) in both C and ARM assembly.
The focus is on preventing side-channel attacks by ensuring constant-time execution.

Files:
- mmm_03.c              : Base code provided my Professor Mihai Sima
- main.c                : Main C program with logic for testing MMM
- mmm_original.c        : Isolated original C version of the MMM function
- mmm_original.s        : Compiler generated version of original MMM function
- mmm_optimized.c       : Refactored original MMM function (c Code) for SCA defense
- mmm_optimized.s       : Compiler generated version of optimized MMM function
- mmm_custom.s          : Hand optimized Assembly version of the MMM function
- mmm_test              : Output executable (created after compilation)

To build:
$ gcc main.c mmm_original.c mmm_optimized.s -o mmm_test

To run:
$ ./mmm_test

You will be prompted to input values for X and Y. The program compares C and assembly implementations and performs additional modular multiplication tests using scaling.

This implementation uses masking techniques to avoid data-dependent branches and reduce timing leakage.

