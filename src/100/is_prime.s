// is_prime.s
// created by Vrindavan Sanap
// tell if the given number is prime or not

.global _main
.align 4

.text
_main:
	stp     x29, x30, [sp, #-16]!
	mov     x29, sp

	ldr     x0, =99991
	bl      _is_prime
	bl      _uitoa
	bl      _write_stdout
	bl      _newline

	ldp     x29, x30, [sp], #16
	mov     x0, #0
	ret

_is_prime:

	// inputs
	// x0 : n (unsigned integer to test)
	// outputs
	// x0
	// if n is prime : 1
	// if n is not prime : 0
	cmp     x0, #2
	b.lt    _not_prime

	sub     x1, x0, #1
_loop:
	cmp     x1, #1
	b.eq    _prime

	udiv    x2, x0, x1
	msub    x3, x1, x2, x0
	cbz     x3, _not_prime

	sub     x1, x1, #1
	b       _loop
_prime:
	mov     x0, #1
	ret

_not_prime:
	mov     x0, #0
	ret
