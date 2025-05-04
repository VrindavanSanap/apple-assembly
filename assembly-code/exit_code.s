.global _main
.balign 4
_main:

  // what is our exit code
  mov x0, #7  // move '7' into 32 bit register 

  // move '1' into 32 bit register-read by 0S
  // which syscall to perform 
  // here #1 is exit syscall
  mov x16, #1 

  // perform syscall, look at x16 to see
  // which sycall to perform 
  svc 0

