.global _main
.align 4

_main: 
	; move 20 to the x0 register
  mov x0, #21
  mov x1, #7
	;unsiged divide x0 register by x1 register and store the result in x0 register
	udiv x0, x0, x1
	; set x16 to 1 (syscall number for exit)
  mov x16, #1
	; supervisor  make the system call happen hence exit the program
	svc 0
