.global _main
.balign 4
_main:
  fmov d1, #2.5
  fmov d2, #3.5
  fadd d0, d1, d2
  fcvtzs x0, d0
  mov x16, #1
  svc #0x80
