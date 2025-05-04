### 🧠 Quick Note on Register Suffixes

In ARM assembly, registers are categorized based on their size:

- **`w0–w30`**: Represent **32-bit registers**.
- **`x0–x30`**: Represent **64-bit registers**.

#### Additional Information:
- The `w` registers are the lower 32 bits of the corresponding `x` registers.
- Register `x31` is often used as the stack pointer (`sp`) or zero register (`zr`) depending on the context.
- ARM registers are used for various purposes, including general computation, function arguments, and return values.

