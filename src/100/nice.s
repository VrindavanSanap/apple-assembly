// 10.s
// created by Vrindavan Sanap
// Prints 69420 to stdout

.global _main
.align 4

.text
_main:
	stp     x29, x30, [sp, #-32]!
	mov     x29, sp
	ldr     x0, =69420

	bl      _uitoa
	bl      _write_stdout

	ldp     x29, x30, [sp], #32
	mov     x0, #0
	ret
