⸻

svc 0

Perform a syscall
This instruction triggers a supervisor call (SVC) with immediate value 0. It is used to invoke operating system services or system calls from user space.

⸻

MSUB Xd, Xn, Xm, Xa

Multiply-Subtract (extended)
Performs the operation:

Xd = Xa – (Xn × Xm)

This computes the product of Xn and Xm, subtracts it from Xa, and stores the result in Xd.

⸻

LDR destination_register, [source_addr]

Load Register
Loads a 64-bit (or 32-bit depending on context) value from memory at source_addr into destination_register.

⸻

STR source_register, [destination_addr]

Store Register
Stores the value from source_register into memory at destination_addr.

⸻
