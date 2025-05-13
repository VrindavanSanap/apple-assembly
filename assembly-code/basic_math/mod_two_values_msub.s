.global _main
.align 4

	; Dividend = (Divisor × Quotient) + Remainder
	; Remainder = Dividend - (Divisor × Quotient)
_main: 
	; Move 10 to the x0 register
	; x0 is our dividend(number to be divided)
	
	mov x0, #10
	; Move 3 to the x1 register
	; x1 is our divisor (number to divide by)	
	mov x1, #4

	; We want to calculate the remainder of x0 register divided by x1 register

	; Unsigned divide x0 register by x1 register and store the result in x2 register
	udiv x2, x0, x1  ; (x0 / x1 = x2 is our quotient quotient)

	;	To calculate remainder we need Dividend divisor and quotient
	; we have the dividend and the divisor in x0 and x1 registers
	; And we have the quotient in x2 register

	; Now we can use msub instruction to calculate the remainder
	; Remainder = Dividend - (Divisor × Quotient)
	; Remainder = x0 - (x1 * x2)


	; MSUB Xd, Xn, Xm, Xa give us Xd = Xa – (Xn × Xm).
	; we want to store the remainder in x3 register
	; Xd = x3
	; Xa = x0 (10)
	; Xn = x1 (4)
	; Xm = x2 (2)
	; x3 = x0(10) - (x1(4) * x2(2))
	msub x3, x1, x2, x0
	; Now we have the remainder in x3 register

	; Move the result to x0 register to return it
	mov x0, x3

	; Set x16 to 1 (syscall number for exit)
	mov x16, #1

	; Supervisor call to make the system call happen and exit the program
	svc 0
