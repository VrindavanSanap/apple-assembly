// 10.s
// created by Vrindavan Sanap
// Prints the given digit (0-9) to stdout

.global _main
.align 4
.data
buffer: .ds 8

.text
_main:
	stp     x29, x30, [sp, #-16]!
	mov     x0, #3
	bl      _int_to_char
	mov     x1, x0

	adrp    x0, buffer@PAGE
	add     x0, x0, buffer@PAGEOFF

	strb    w1, [x0]
	mov     x1, #10
	strb    w1, [x0, #01]
	mov     x1, #2
	bl      _write_stdout

	ldp     x29, x30, [sp], #16

	mov     x0, #0
	ret
