Sure, let's illustrate the combination with an example using 
sample memory addresses.

Let's assume the initial value of the stack pointer (`sp`) is 
`0x1000`.

### Function Prologue:
```assembly
stp x29, x30, [sp, #-0x10]!  // Store x29 and x30 onto the 
stack and decrement sp by 16 bytes
```
After this instruction:
- `x29` (frame pointer) will be stored at `[sp - 0x10]`.
- `x30` (link register) will be stored at `[sp - 0x8]`.
- `sp` will be decremented by 16 bytes.

Example:
- `x29` stored at `[0xFF0]`.
- `x30` stored at `[0xFF8]`.
- `sp` becomes `0xFF0`.

### Function Epilogue:
```assembly
ldp x29, x30, [sp], #0x10  // Load x29 and x30 from the stack 
and increment sp by 16 bytes
```
After this instruction:
- `x29` and `x30` will be loaded back from memory.
- `sp` will be incremented by 16 bytes.

Example:
- `x29` loaded from `[0xFF0]`.
- `x30` loaded from `[0xFF8]`.
- `sp` becomes `0x1000` again.

### Summary:
- Before function call:
  stp    x29, x30, [sp, #-0x10]! 
  - `sp` points to `0x1000`.
  - Function Prologue:
    - `x29` and `x30` are saved onto the stack at `[0xFF0]` 
       and `[0xFF8]` respectively.
   - `sp` becomes `0xFF0`.

  ldp    x29, x30, [sp], #0x10
  - Function Epilogue:
    - `x29` and `x30` are loaded back from `[0xFF0]` and 
      `[0xFF8]` respectively.
    - `sp` becomes `0x1000` again.

  This ensures that at the end of the function, the 
  frame pointer (`x29`) and link register (`x30`) are 
  restored to their original values, and the stack pointer 
  (`sp`) is back to its original position.
