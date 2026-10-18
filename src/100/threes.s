// three.s
// created by Vrindavan Sanap
// Writes the powers of 3 from 3^0 to 3^10 to stdout

.global _main

.text
.align 4

_main:
	stp     x29, x30, [sp, #-32]!
	mov     x29, sp
	str     x20, [sp, #24]
	mov     x20, #0
	mov     x0, #1

_loop:
	cmp     x20, #10
	bgt     _exit
	str     x0, [sp, #16]

	bl      _uitoa
	bl      _write_stdout
	bl      _newline

	ldr     x0, [sp, #16]
	add     x0, x0, x0, lsl #1
	add     x20, x20, #1

	b       _loop

_exit:
	ldr     x20, [sp, #24]
	ldp     x29, x30, [sp], #32
	mov     x0, #0
	ret
