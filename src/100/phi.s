// phi.s
// created by Vrindavan Sanap
// calculates the euler phi function for [1, 100]

.global _main
.align 4

.text
_main:
	stp     x29, x30, [sp, #-32]!
	mov     x29, sp
	str     x20, [sp, 16]
	mov     x20, #1

Lmain_loop:
	cmp     x20, #100
	b.gt    Lmain_exit
	mov     x0, x20
	bl      _uitoa
	bl      _write_stdout
	bl      _space

	mov     x0, x20
	bl      _phi
	bl      _uitoa
	bl      _write_stdout
	bl      _newline

	add     x20, x20, #1
	b       Lmain_loop

Lmain_exit:
	ldr     x20, [sp, 16]
	ldp     x29, x30, [sp], #32
	mov     x0, #0
	ret

_phi:
	stp     x29, x30, [sp, #-48]!
	mov     x29, sp
	str     x20, [sp, 16]
	str     x21, [sp, 24]
	str     x22, [sp, 32]
	mov     x20, #1
	mov     x21, x0
	mov     x22, #0

Lphi_loop:
	cmp     x20, x21
	b.eq    Lphi_exit
	mov     x0, x20
	mov     x1, x21
	bl      _coprime

	add     x22, x22, x0

	add     x20, x20, #1
	b       Lphi_loop

Lphi_exit:
	mov     x0, x22
	ldr     x20, [sp, 16]
	ldr     x21, [sp, 24]
	ldr     x22, [sp, 32]
	ldp     x29, x30, [sp], #48
	ret
