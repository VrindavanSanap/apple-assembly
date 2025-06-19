# ARM64 Registers Overview

## System Call Number Register

In ARM64, **`x16`** is designated as the **system call number register**. This convention is defined by the ARM64 ABI (Application Binary Interface), which specifies how system calls are managed in user-space applications.

Here’s a breakdown of some common system call numbers (with `x16` holding the system call number):

- `x16 = 1` — `exit()` system call (exit the program)
- `x16 = 64` — `write()` system call (write data to a file or output)
- `x16 = 93` — `open()` system call (open a file)
- `x16 = 218` — `clone()` system call (create a new process)

---

## General-Purpose Registers

ARM has 31 general-purpose registers: `x0` to `x30`.

- Each `xN` has a corresponding `wN` that refers to its lower 32 bits.
- Writing to a `wN` register (e.g., `w0`) zeros out the upper 32 bits of its corresponding `xN` register (e.g., `x0`).

---

## Immediate Values in ARM

In ARM assembly, the `#` prefix is used to denote an **immediate** (constant) value.  
This distinguishes it from a register or memory address.

**Example:**

```asm
mov x0, #5   // Move the constant value 5 into register x0
````

---

## Return Address Register (`x30`)

The **return address** is the memory address to which the program should jump back after a function call is completed.

In ARM64, this return address is stored in **`x30`**, also known as the **link register** (`lr`).

**Example:**

```asm
bl function   // Branch to function and link (store return address in x30)
ret           // Return to address in x30
```

https://eclecticlight.co/wp-content/uploads/2021/06/armregisterarch.pdf
