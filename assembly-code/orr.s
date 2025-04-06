.global _main
.balign 4
_main:
  mov w0, w1 // register-register move
  orr w0, wzr, w1 // logical or with zero register
  mov x0, #0
  mov x16, #1
  svc #0x80
  

