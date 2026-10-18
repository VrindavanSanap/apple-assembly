// euclid.s
// created by Vrindavan Sanap
// provides the gcd of two give numbers

// the entire algorithm works on two facts (assuming a > b)
// if a % b == 0; gcd(a, b) = b
// else gcd(a, b) = gcd(b, a %b)

.global _main
.align 4

_main:
	stp     x29, x30, [sp, #-32]!
	mov     x29, sp
	ldr     x0, =484
	ldr     x1, =781
	bl      _gcd

	bl      _uitoa
	bl      _write_stdout
	bl      _newline

	ldp     x29, x30, [sp], #32
	mov     x0, #0
	ret

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
	cbz     x3, _found_gcd

	// else gcd(a, b) = gcd(b, a %b)
	mov     x1, x3
	bl      _gcd

_found_gcd:

	ldp     x29, x30, [sp], #32
	ret
