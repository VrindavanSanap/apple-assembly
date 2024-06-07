.global _main
.balign 4
_main:

  // what is our exit code
  mov x0, #0 
  mov x0, #1
  mov x0, #2
  mov x0, #3
  mov x0, #4
  mov x0, #6
  mov x0, #7 
  mov x1, #7
  mov x1, #8
  mov x0, #16
  mov x0, #32 

  // move '1' into 32 bit register-read by 0S
  // which syscall to perform 
  // here #1 is exit syscall
  mov x16, #1 

  // perform syscall, look at x16 to see
  // which sycall to perform 
  svc #0x80

