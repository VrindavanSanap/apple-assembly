.global _main
.balign 4
_main:

  // Write the guestion 
  mov x0, #1          // stdout = '1'
  adr x1, question    // x1 specifies our string
  mov x2,  20         // x2 specifies how long is our string 
  mov x16, #4         // 4 is write syscall
  svc #0x80           // supervisor call 


  // Read the input 
  adr x1, buffer      // x1 specifies our buffer 
  mov x2, 20          // x2 specifies how long is our buffer is  
  mov x0, #0          // x0 spefies file descriptor(stdin)
  mov x8, #3        // 63 is read syscal
  svc #0x80           // supervisor call 

  // now exit:
  mov x0, #0
  mov x16, #1         //1 = terminate syscall
  svc #0x80


question: .ascii "What is your name?\n:"
buffer : .space 20


