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

