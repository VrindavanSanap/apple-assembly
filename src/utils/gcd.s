.global _gcd
.global _coprime
.align 4

_gcd:
	// inputs
	// x0: a
	// x1: b

	// outputs
	// x0: gcd(a, b)
	stp     x29, x30, [sp, #-32]!
	mov     x29, sp

	cmp     x0, x1
	csel    x2, x0, x1, hs
	csel    x1, x1, x0, hs
	mov     x0, x2

	// if a % b == 0; gcd(a, b) = b
	udiv    x2, x0, x1
	msub    x3, x1, x2, x0
	mov     x0, x1
	cbz     x3, Lgcd_exit

	// else gcd(a, b) = gcd(b, a %b)
	mov     x1, x3
	bl      _gcd

Lgcd_exit:

	ldp     x29, x30, [sp], #32
	ret

_coprime:
	//inputs
	// x0:a
	// x1:b

	// outputs
	// x0:  1 if a and b are coprime
	// x0:  0 if a and b are not copime

	stp     x29, x30, [sp, #-16]!
	mov     x29, sp

	bl      _gcd
	cmp     x0, #1
	CSET    X0, EQ

	ldp     x29, x30, [sp], #16
	ret
