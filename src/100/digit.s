// 10.s
// created by Vrindavan Sanap
// Prints 7 to stdout

.global _main
.align 4

.text
_main:
	stp     x29, x30, [sp, #-32]!
	mov     x29, sp

	mov     x0, #7
	bl      _int_to_char
	strb    w0, [sp, #16]

	mov     x0, #10
	strb    w0, [sp, #17]

	add     X0, sp, #16
	mov     x1, #2
	bl      _write_stdout
	

	ldp     x29, x30, [sp], #32

	mov     x0, #0
	ret
