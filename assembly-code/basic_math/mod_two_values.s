.global _main
.align 4

mod_two_val: 
	; Move 10 to the x0 register
	mov x0, #10

	; Move 3 to the x1 register
	mov x1, #4

	; Unsigned divide x0 register by x1 register and store the result in x2 register
	udiv x2, x0, x1  ; (x0 / x1 = x2 is quotient)

	; Multiply x2 by x1 and store the result in x3
	mul x3, x2, x1   ; (x2 * x1 = x3 is product)

	; Subtract x3 from x0 and store the result in x4 (remainder)
	sub x4, x0, x3   ; (x4 = x0 - x3 is remainder)

	mov x0, x4	
	; Set x16 to 1 (syscall number for exit)
	mov x16, #1

	; Supervisor call to make the system call happen and exit the program
	svc 0
