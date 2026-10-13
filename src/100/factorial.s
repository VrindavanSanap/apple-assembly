// fatorial.s
// created by Vrindavan Sanap
// Prints the fatorial of a 13 to stdout

.global _main
.align 4

.text
_main:
	stp     x29, x30, [sp, #-16]!
	mov     x29, sp
	mov     x0, #13
	bl      _factorial
	bl      _uitoa
	bl      _write_stdout
	ldp     x29, x30, [sp], #16
	mov     x0, #0
	ret

_factorial:

	// inputs
	// x0 : n (the number of which we want to take factorial of)

	// outputs
	// x0 : n!

	stp     x29, x30, [sp, #-64]!
	mov     x29, sp

	// if n == 0: return 1
	// else if n == 1: return 1
	cmp     x0, #0  ;
	b.ls _base_case


	str     x0, [sp, #16]
	sub     x0, x0, #1
	// else return n * (n - 1)
	bl      _factorial
	mov     x1, x0
	ldr     x0, [sp, #16]
	mul     x0, x0, x1

	ldp     x29, x30, [sp], #64
	ret

_base_case:
	mov     x0, #1
	ldp     x29, x30, [sp], #64
	ret
