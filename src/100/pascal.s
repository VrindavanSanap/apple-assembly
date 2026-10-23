// pascal.s
// created by Vrindavan Sanap
// prints the first 6 rows of Pascal's triangle

.global _main
.align 4

.text
_main:
	stp     x29, x30, [sp, #-32]!
	mov     x29, sp
	str     x20, [sp, 16]
	mov     x20, #0

Lmain_loop:
	cmp     x20, #6
	b.eq    Lmain_exit
	mov     x0, x20
	bl      _pascal_row
	add     x20, x20, #1
	b       Lmain_loop

Lmain_exit:
	ldr     x20, [sp, 16]
	ldp     x29, x30, [sp], #32
	mov     x0, #0
	ret

_pascal_row:
	//prints nth row of pascals triagnle
	// inputs
	// x0:n

	stp     x29, x30, [sp, #-32]!
	mov     x29, sp

	str     x20, [sp, #16]
	str     x21, [sp, #24]

	mov     x20, #0
	mov     x21, x0

Lpascal_row_loop:
	cmp     x20, x21
	b.gt    Lpascal_exit
	mov     x0, x21
	mov     x1, x20
	bl      _comb
	bl      _uitoa
	bl      _write_stdout
	bl      _space
	add     x20, x20, #1
	b       Lpascal_row_loop

Lpascal_exit:
	bl      _newline
	ldr     x20, [sp, #16]
	ldr     x21, [sp, #24]
	ldp     x29, x30, [sp], #32
	ret
