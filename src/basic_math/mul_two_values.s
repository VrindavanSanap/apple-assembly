.global _main
.align 4

_main: 
	; move 20 to the x0 register
  mov x0, #3
  mov x1, #7
	; multiply  x0 by x1 and save the result in x0
	mul x0, x0, x1
	; set x16 to 1 (syscall number for exit)
  mov x16, #1
	; supervisor  make the system call happen hence exit the program
	svc 0
