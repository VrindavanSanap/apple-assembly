.global _main    // Provide program starting address to linker
.align 4         // Make sure everything is aligned properly.

.text
.align 4


_main:
   mov x0, #4206
   bl _int_to_str
mov x0, #68
bl _int_to_str
    mov x0, #0
    bl _exit
