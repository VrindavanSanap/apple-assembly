.global _main
.align 4

_main: 
	; move 20 to the x0 register
  mov x0, #20
	; add 22 to x0 and save the result in x0
	add x0, x0, #22
	; set x16 to 1 (syscall number for exit)
  mov x16, #1
	; make the system call happen hence exit the program
	svc 0
