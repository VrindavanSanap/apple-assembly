.global _main          // Provide program starting address to linker
.align 4               // Make sure everything is aligned properly

// Print "Hello World!" 5 times
_hello:
  adrp    X1, helloworld.str@PAGE       // Load string address (page)
  add     X1, X1, helloworld.str@PAGEOFF // Load string address (offset)
  mov     X0, #1                        // 1 = StdOut
  mov     X2, #13                       // Length of the string
  mov     X16, #4                       // Unix write system call
  svc     #0x80                         // Make system call
  add     X5, X5, 1                     // Increment counter
  cmp     X5, 5                         // Compare counter with 5
  bne     _hello                        // Loop if not equal
  b       _exit                         // Exit if done

_exit:
  mov     X0, #0                        // Exit code 0
  mov     X16, #1                       // Unix exit system call
  svc     #0x80                         // Call kernel to terminate the program

_main:
  mov     X5, 0                         // Initialize counter to 0
  b       _hello                        // Jump to _hello

helloworld.str:
  .asciz "Hello World!\n\0"             // Null-terminated string
