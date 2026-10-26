// 2015_day1_part1.s
// created by Vrindavan Sanap
// solves advent of code 2015 day1 part2
// https://adventofcode.com/2015/day/1

.global _main
.align 4
_main:

	stp     x29, x30, [sp, #-48]!
	str     x19, [sp, 16]
	str     x20, [sp, 24]
	str     x21, [sp, 32]
	str     x22, [sp, 40]

	mov     x29, sp
	adrp    x0, file_name@PAGE
	add     x0, x0, file_name@PAGEOFF
	bl      _read_file
	// x0 has the buffer
	// x1 has buffer size
	mov     x19, #0
	mov     x20, x1
	mov     x21, x0
	// counter
	mov     x22, #0

Lmain_loop:
	cmp     x19, x20
	b.eq    Lmain_exit
	ldrb    w0, [x21, x19]
	cmp     w0, #10
	b.eq    Lmain_exit
	sub     w0, w0, #40
	mov     w1, #1
	sub     w0, w1, w0, lsl #1
	add     x22, x22, w0, sxtw
	cmp     x22, #-1
	b.eq    Lmain_exit

	add     x19, x19, #1
	b       Lmain_loop

Lmain_exit:
	add     x0, x19, #1
	bl      _uitoa
	bl      _write_stdout
	bl      _newline

	ldr     x19, [sp, 16]
	ldr     x20, [sp, 24]
	ldr     x21, [sp, 32]
	ldr     x22, [sp, 40]

	ldp     x29, x30, [sp], #48

	mov     x0, #0
	ret

.section __TEXT, __cstring
file_name:
.asciz "day1.txt"

failed_msg:
.asciz "Reading file failed!\n"
.equ failed_msg_len, . - failed_msg - 1
