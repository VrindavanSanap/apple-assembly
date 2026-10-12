// int_to_str.s
// created by Vrindavan Sanap
// converts unsigned int to string (base 10)

.zerofill __DATA, __bss, _buffer, 10, 0

.global _uitoa

_uitoa:
	//args
	// x0 unsigned int to be converted
	// returns

	// x0 address of the buffer
	// x1 length of the buffer

	stp     x29, x30, [sp, #-16]!
	mov     x29, sp

	adrp    x1, _buffer@PAGE
	add     x1, x1, _buffer@PAGEOFF
	mov     x3, #10
	mov     x5, #1
	mov     x4, x0

_loop:
	//  x2 = x0 % x3(10)

	mov     x0, x4
	udiv    x2, x0, x3
	mov     x4, x2
	msub    x2, x2, x3, x0

	mov     x0, x2
	bl      _int_to_char

	neg     x6, x5
	add     x6, x6, #10

	strb    w0, [x1, x6]
	add     x5, x5, #1

	cmp     x4, #0
	b.gt    _loop
	mov     x0, x1
	mov     x1, #10
	ldp     x29, x30, [sp], #16
	ret
