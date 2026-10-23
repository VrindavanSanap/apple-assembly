// int_to_str.s
// created by Vrindavan Sanap
// converts unsigned int to ASCII string (base 10)

.zerofill __DATA, __bss, _buffer, 20, 0

.global _uitoa

_uitoa:
	//args
	// x0 unsigned int to be converted
	// returns

	// x0 address of the string
	// x1 length of the string

	adrp    x1, _buffer@PAGE
	add     x1, x1, _buffer@PAGEOFF
	mov     x3, #10
	mov     x5, #20
	mov     x4, x0

Luitoa_loop:
	//  x2 = x0 % x3(10)

	sub     x5, x5, #1
	mov     x0, x4
	udiv    x2, x0, x3
	mov     x4, x2
	msub    x2, x2, x3, x0

	mov     x0, x2
	add     x0, x0, #'0'

	// index = buffer + (20 - n)
	strb    w0, [x1, x5]


	cbnz    x4, Luitoa_loop

	// x0 should be buffer +  (20 - n)
	add     x0, x1, x5

	// length = 20 - last index
	neg     x5, x5
	add     x5, x5, #20

	mov     x1, x5
	ret
