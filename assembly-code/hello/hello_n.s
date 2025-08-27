.global _main          // Provide program starting address to linker
.align 4               // Make sure everything is aligned properly

// Print "Hello World!" 5 times
_hello:
  adrp    x0, helloworld.str@PAGE       // Load string address (page)
  add     x0, x0, helloworld.str@PAGEOFF // Load string address (offset)
  mov     x1, 13
  bl _write_stdout 

  add     X5, X5, 1                     // Increment counter
  cmp     X5, 5                         // Compare counter with 5
  bne     _hello                        // Loop if not equal  

_exit:
  mov     X0, #0                        // Exit code 0
  mov     X16, #1                       // Unix exit system call
  svc     #0x80                         // Call kernel to terminate the program

_main:
  mov     X5, 0                         // Initialize counter to 0
  b       _hello                        // Jump to _hello

helloworld.str:
  .asciz "Hello World!\n\0"             // Null-terminated string
