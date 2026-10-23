// 10.s
// created by Vrindavan Sanap
// Prints the numbers (0-9) to stdout

.global _main

.text
.align 4

_main:
	stp     x29, x30, [sp, #-32]!
	mov     x29, sp
	str     x20, [sp, #24]
	mov     x20, #0

_loop:
	cmp     x20, #10
	beq     _exit
	mov     x0, x20

	bl      _uitoa
	bl      _write_stdout
	bl      _newline

	add     x20, x20, #1
	b       _loop

_exit:
	ldr     x20, [sp, #24]
	ldp     x29, x30, [sp], #32
	mov     x0, #0
	ret
