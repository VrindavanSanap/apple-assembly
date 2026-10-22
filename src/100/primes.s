// primes.s
// created by Vrindavan Sanap
// prints all the primes between 1 and 100

.global _main

.text
.align 4

_main:
	stp     x29, x30, [sp, #-32]!
	mov     x29, sp
	str     x20, [sp, #24]
	mov     x20, #1

_mloop:
	cmp     x20, #100
	beq     _exit
	mov     x0, x20
	bl      _is_prime
	add     x20, x20, #1
	cbz     x0, _mloop

	sub     x0, x20, #1
	bl      _uitoa
	bl      _write_stdout
	bl      _newline
	b       _mloop

_exit:
	ldr     x20, [sp, #24]
	ldp     x29, x30, [sp], #32
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
