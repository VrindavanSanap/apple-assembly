.global _main
.balign 4
_main:
  mov x0, #7  // move '7' into 32 bit register 
  mov x16, #1 // move '1' into 32 bit register-read by 0S
  svc #0x80
