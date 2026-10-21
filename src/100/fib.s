// fib.s
// created by Vrindavan Sanap
// Prints the first 10 fibonacci numbers

.global _main
.align 4

.text
_main:
	stp     x29, x30, [sp, #-48]!
	mov     x29, sp

	str     x20, [sp, 16]

	mov     x0, #0
	mov     x1, #1
	mov     x20, #0

_loop:
	str     x0, [sp, 24]
	str     x1, [sp, 32]

	bl      _uitoa
	bl      _write_stdout
	bl      _newline

	// x0 = x1; x1 = x0 + x1
	ldr     x1, [sp, 24]
	ldr     x0, [sp, 32]

	// next fib number
	add     x0, x0, x1

	add     x20, x20, #1
	cmp     x20, #10

	str     x1, [sp, 24]

	bne     _loop

	ldr     x20, [sp, 16]

	ldp     x29, x30, [sp], #48
	mov     x0, #0
	ret
