## A64 Addressing Modes on Apple Silicon

This guide covers common immediate offset addressing for load instructions. In A64, 64-bit general-purpose registers are named `x0-x30`, and their 32-bit counterparts are `w0-w30`. Since memory addresses are 64-bit, the base register will almost always be an `x` register.

---

### 1. Base Register Indirect Addressing
This is the simplest mode, where a register holds the exact memory address.

* **Syntax**: `ldr x1, [x0]`
* **Description**: The 64-bit value from the memory address held in register `x0` is loaded into register `x1`. The base register `x0` is not changed.
* **Operation**: `x1 = memory[x0]`

---

### 2. Pre-indexed Addressing (Offset)
An offset is added to the base register to form the effective address *before* the memory access. The base register itself is **not updated**.

* **Syntax**: `ldr x1, [x0, #16]`
* **Description**: An effective address is calculated by `x0 + 16`. The value at this new address is loaded into `x1`. The base register `x0` remains unchanged. This mode supports a large, scaled, positive-only offset (up to 32760 bytes for a 64-bit load).
* **Operation**: `x1 = memory[x0 + 16]`

---

### 3. Pre-indexed Addressing with Write-back
The offset is added to the base register *before* memory is accessed, and the base register is then **updated** with this new effective address. The `!` symbol signals this "write-back."

* **Syntax**: `ldr x1, [x0, #16]!`
* **Description**: The effective address is calculated (`x0 + 16`), the value from that address is loaded into `x1`, and *then* `x0` is updated to hold the new address. This is very efficient for iterating through memory.
* **Operation**:
    1.  `address = x0 + 16`
    2.  `x1 = memory[address]`
    3.  `x0 = address`

---

### 4. Post-indexed Addressing
The memory access happens at the address in the base register *first*, and *then* the base register is updated with the offset.

* **Syntax**: `ldr x1, [x0], #16`
* **Description**: The value at the location pointed to by `x0` is loaded into `x1`. *After* the load completes, the `x0` register is updated by adding the offset.
* **Operation**:
    1.  `x1 = memory[x0]`
    2.  `x0 = x0 + 16`

---

## A64 Immediate Offset Ranges
A key difference in A64 is how offset ranges work.

* **Pre-indexed (No Write-back)**: Uses an **unsigned 12-bit immediate**, automatically scaled by the size of the data being transferred. For a 64-bit load (`ldr x1, ...`), the transfer size is 8 bytes.
    * Range: `0` to `4095`, scaled by 8, giving a byte offset of **`0` to `32760`**.
* **Pre/Post-indexed (With Write-back)**: Uses a **signed 9-bit immediate** byte offset.
    * Range: **`-256` to `+255`**.


## Additional A64 Addressing Modes

These modes provide more flexibility for calculating memory addresses, especially for complex data structures and position-independent code.

-----

### 5\. Register Offset Addressing

Instead of a fixed immediate offset, the offset can be provided by another register. This is essential for dynamic memory access, like iterating through an array where the index is a variable.

  * **Syntax**: `ldr x2, [x0, x1]`
  * **Description**: The value in the offset register (`x1`) is added to the base register (`x0`) to form the final memory address.
  * **Operation**: `x2 = memory[x0 + x1]`

You can also scale the offset register by shifting it, which is incredibly efficient for array indexing. The most common shift is `LSL` (Logical Shift Left).

  * **Syntax with Scaling**: `ldr w2, [x0, w1, lsl #2]`
  * **Description**: This is perfect for accessing an array of 32-bit (4-byte) integers. The index in `w1` is multiplied by 4 (`lsl #2` is a shift left by 2 bits, which is equivalent to `* 4`) and then added to the base address in `x0`.
  * **Operation (C-style)**: `w2 = array_base[index]`, where `x0` is `array_base` and `w1` is `index`.

-----

### 6\. Load/Store Pair Addressing 🤝

A64 introduced powerful instructions to load or store **two registers at once**. `LDP` (Load Pair) and `STP` (Store Pair) are heavily used by the compiler for setting up and tearing down function stack frames. They have their own addressing modes, which mirror the single-register versions.

  * **Pre-indexed**: `ldp x1, x2, [x0, #16]`
      * Loads `x1` from `[x0 + 16]` and `x2` from `[x0 + 24]`. `x0` is unchanged.
  * **Pre-indexed with Write-back**: `stp x1, x2, [sp, #-16]!`
      * This is a classic way to push two registers onto the stack. `sp` (the stack pointer) is first decremented by 16, then `x1` and `x2` are stored at the new stack-top address.
  * **Post-indexed**: `ldp x1, x2, [sp], #16`
      * This is how you pop two registers off the stack. `x1` and `x2` are loaded from the current `sp` address, and *then* `sp` is incremented by 16.

The immediate offset for pair instructions is a **signed 7-bit immediate** scaled by the access size (8 bytes for `x` registers), giving it a range of **-512 to +504** bytes.

-----

### 7\. PC-Relative Addressing 🗺️

Modern applications use **position-independent code (PIC)**, meaning the code can run correctly regardless of where it's loaded into memory. This requires addressing data relative to the **Program Counter (PC)** instead of using absolute addresses.

The primary instructions for this are `ADR` and `ADRP`.

  * **`ADR` (Address of PC-Relative data)**

      * **Syntax**: `adr x0, my_label`
      * **Description**: Calculates the address of `my_label` and puts it in `x0`. This works for labels within a **+/- 1MB** range of the current instruction. It's used for accessing nearby data.

  * **`ADRP` (Address of PC-Relative Page)**

      * **Syntax**: `adrp x0, my_global_variable`
      * **Description**: This is for accessing data further away (up to **+/- 4GB**). It calculates the address of the 4KB memory **page** that contains the label and puts it in `x0`. The lower 12 bits of the result are cleared to zero. You must then add the lower 12 bits of the address in a second step.
      * **Example Usage**:
        ```armasm
        ; Get the full 64-bit address of my_global_variable into x0
        adrp  x0, my_global_variable    ; Get the 4KB page address
        add   x0, x0, :lo12:my_global_variable ; Add the 12-bit offset within the page
        ```

Assemblers provide a convenient pseudo-instruction that handles this for you automatically:

  * **Literal Load Pseudo-Instruction**: `ldr x1, =my_global_variable`
      * **Description**: This is not a real instruction. The assembler will convert it into the appropriate `ADRP` and `ADD` (or `LDR`) sequence needed to load the address of `my_global_variable` into `x1`. This is the most common way you'll see global variable addresses being loaded in source code.
 