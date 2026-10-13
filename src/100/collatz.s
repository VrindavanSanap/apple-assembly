// collatz.s
// created by Vrindavan Sanap
// Prints the collatz conjecture result for a number

.global _main
.align 4

.text
_main:
	stp     x29, x30, [sp, #-16]!
	mov     x29, sp
	mov     x0, #100
	bl      _collatz
	ldp     x29, x30, [sp], #16
	mov     x0, #0
	ret

_collatz:

	// inputs
	// x0 : n

	stp     x29, x30, [sp, #-64]!
	mov     x29, sp

	str     x0, [sp, #16]
	bl      _uitoa
	bl      _write_stdout
	bl      _newline
	ldr     x0, [sp, #16]
	cmp     x0, #1
	b.eq   _collatz_return

	tbz     x0, #0, _is_even

_is_odd:
	mov     x1, #3
	mul     x0, x0, x1
	add     x0, x0, #1

	bl      _collatz
	b       _collatz_return

_is_even:
	mov     x1, #2
	udiv    x0, x0, x1
	bl      _collatz
	b       _collatz_return

_collatz_return:
	mov     x0, #0
	ldp     x29, x30, [sp], #64
	ret
