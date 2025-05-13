#### System Call Number Register

In ARM64, **`x16`** is designated as the **system call number register**. This convention is defined by the ARM64 ABI (Application Binary Interface), which specifies how system calls are managed in user-space applications.

Here’s a breakdown of some common system call numbers (with `x16` holding the system call number):

- `x16 = 1` — `exit()` system call (exit the program)
- `x16 = 64` — `write()` system call (write data to a file or output)
- `x16 = 93` — `open()` system call (open a file)
- `x16 = 218` — `clone()` system call (create a new process)

---

ARM has 31 general-purpose registers: `x0` to `x30`.  
Each `xN` has a corresponding `wN` that refers to its lower 32 bits.  
Writing to `w0` zeros out the upper 32 bits of `x0`.

Why use #?
In ARM assembly, the # prefix is used to denote an immediate (constant) value. This distinguishes it from a register or memory address.