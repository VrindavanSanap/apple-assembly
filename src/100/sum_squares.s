// sum_squares.s
// created by Vrindavan Sanap
// Prints the sum of squares of first 10 natural numbers

.global _main
.align 4

.text
_main:
	stp     x29, x30, [sp, #-16]!
	mov     x29, sp
	mov     x0, #10

	// we want  n(n+1)(2n+1)/6
	add     x1, x0, #1  // x1 = x0 + 1 = n + 1
	add     x2, x0, x1  // x2 = x0 + x1 = 2n + 1
	mul     x0, x0, x1
	mul     x0, x0, x2

	mov     x3, #6
	udiv    x0, x0, x3
	bl      _uitoa
	bl      _write_stdout
	bl      _newline

	mov     x0, #0
	ldp     x29, x30, [sp], #16
	ret
