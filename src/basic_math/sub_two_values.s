.global _main
.align 4

_main: 
	; move 18 to the x0 register
  mov x0, #18
	; subtract 8 from x0 and save the result in x0
	sub x0, x0, #8
	; set x16 to 1 (syscall number for exit)
  mov x16, #1
	; supervisor  make the system call happen hence exit the program
	svc 0
