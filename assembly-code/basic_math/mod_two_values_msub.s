.global _main
.align 4

	; Dividend = (Divisor × Quotient) + Remainder
_main: 
	; Move 10 to the x0 register
	mov x0, #10

	; Move 3 to the x1 register
	mov x1, #4

	; Unsigned divide x0 register by x1 register and store the result in x2 register
	udiv x2, x0, x1  ; (x0 / x1 = x2 is quotient)


	; Set x16 to 1 (syscall number for exit)
	mov x16, #1

	; Supervisor call to make the system call happen and exit the program
	svc 0
