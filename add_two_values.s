.global _main
.align 4

_main:
  mov x0, #20
	add x0, x0, #22
  mov x16, #1
	svc 0
