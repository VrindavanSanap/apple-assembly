#### System Call Number Register

In ARM64, **`x16`** is designated as the **system call number register**. This convention is defined by the ARM64 ABI (Application Binary Interface), which specifies how system calls are managed in user-space applications.

Here’s a breakdown of some common system call numbers (using x16 to hold the number):

x16 = 1 — exit() system call (exit the program).
x16 = 64 — write() system call (write data to a file or output).
x16 = 93 — open() system call (open a file).
x16 = 218 — clone() system call (create a new process).
