// fatorial.s
// created by Vrindavan Sanap

.global _factorial
.global _comb
.align 4

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
	b.ls    Lfactorial_exit

	str     x0, [sp, #16]
	sub     x0, x0, #1
	// else return n * (n - 1)
	bl      _factorial
	mov     x1, x0
	ldr     x0, [sp, #16]
	mul     x0, x0, x1

	ldp     x29, x30, [sp], #64
	ret

Lfactorial_exit:
	mov     x0, #1
	ldp     x29, x30, [sp], #64
	ret

_comb:
	// inputs
	// x0: n
	// x1: k
	// outputs
	// x0 : C(n, k)
	// C(n, k) = n! / (k! * (n - k)!)

	stp     x29, x30, [sp, #-48]!
	mov     x29, sp

	str     x19, [sp, 16]
	str     x20, [sp, 24]
	str     x21, [sp, 32]

	// x20 = k
	mov     x20, x1

	// x21 = (n - k)
	sub     x21, x0, x1

	// x19 = (n!)
	bl      _factorial
	mov     x19, x0

	// x20 = (k!)
	mov     x0, x20
	bl      _factorial
	mov     x20, x0

	// x21 = (n - k)!
	mov     x0, x21
	bl      _factorial
	mov     x21, x0

	// denominator
	mul     x20, x20, x21
	udiv    x19, x19, x20
	mov     x0, x19

	ldr     x19, [sp, 16]
	ldr     x20, [sp, 24]
	ldr     x21, [sp, 32]

	ldp     x29, x30, [sp], #48
	ret
