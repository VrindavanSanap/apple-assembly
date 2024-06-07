.global _main // Provide program starting address to linker
.align 4      // Make sure everything is aligned properly

_main: 

  // fd for stdout
  mov X0, #1                          

  // Exact address of string 
  adrp X1, helloworld.str@PAGE        
  add X1, X1, helloworld.str@PAGEOFF  

  mov X2, #13       // length of our string
  mov X16, #4       // Unix write system call
  svc #0x80         // Call kernel to output the string

  mov     X0,  #1
  mov     X16, #1
  svc     #0x80   

helloworld.str: .asciz "Hello World!\n"

