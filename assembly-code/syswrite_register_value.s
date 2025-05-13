.global _main
.align 4

_main: 
	; move 20 to the x0 register
  mov x0, #20
	
  mov x16, #1
	; supervisor  make the system call happen hence exit the program
	svc 0
