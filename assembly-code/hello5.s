.global _main // Provide program starting address to linker
.align 4      // Make sure everything is aligned properly

// print hello 5 times
_hello:
  adrp X1, helloworld.str@PAGE  // string to print
  add X1, X1, helloworld.str@PAGEOFF  // string to print
  mov X0, #1    // 1 = StdOut
  mov X2, #13       // length of our string
  mov X16, #4   // Unix write system call
  svc     #0x80 
  add x5, x5, 1
  cmp x5, 5
  bne _hello
  b _exit

_exit:
  mov     X0, #0   
  mov     X16, #1  
  svc     #0x80   // Call kernel to terminate the program

_main: 
  mov x5, 0
  b _hello

helloworld.str: .asciz "Hello World!\n\0"
