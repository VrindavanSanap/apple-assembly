// fizz_buzz.s
// created by Vrindavan Sanap
// Prints the fizz buzz squence for (1-19) to stdout

.global _main

.text
.align 4

_main:
	stp     x29, x30, [sp, #-64]!
	mov     x29, sp
	str     x20, [sp, #24]

	mov     x20, #1

	str     x21, [sp, #32]
	str     x22, [sp, #40]
	str     x23, [sp, #48]

	mov     x21, #15
	mov     x22, #3
	mov     x23, #5

_loop:
	cmp     x20, #20
	beq     _exit

	udiv    x2, x20, x21
	msub    x2, x2, x21, x20
	cbz     x2, _fizz_buzz

	udiv    x2, x20, x22
	msub    x2, x2, x22, x20
	cbz     x2, _fizz

	udiv    x2, x20, x23
	msub    x2, x2, x23, x20
	cbz     x2, _buzz
	b       _number

_fizz:
	adrp    x0, fizz.str@PAGE
	add     x0, x0, fizz.str@PAGEOFF
	mov     x1, 4
	bl      _write_stdout
	bl      _newline
	b       _increment

_buzz:
	adrp    x0, buzz.str@PAGE
	add     x0, x0, buzz.str@PAGEOFF
	mov     x1, 4
	bl      _write_stdout
	bl      _newline
	b       _increment

_fizz_buzz:
	adrp    x0, fizzbuzz.str@PAGE
	add     x0, x0, fizzbuzz.str@PAGEOFF
	mov     x1, 8
	bl      _write_stdout
	bl      _newline
	b       _increment

_number:
	mov     x0, x20
	bl      _uitoa
	bl      _write_stdout
	bl      _newline

_increment:
	add     x20, x20, #1
	b       _loop

_exit:
	ldr     x21, [sp, #32]
	ldr     x22, [sp, #40]
	ldr     x23, [sp, #48]


	ldr     x20, [sp, #24]
	ldp     x29, x30, [sp], #64
	mov     x0, #0
	ret

fizz.str:
.asciz "Fizz"

buzz.str:
.asciz "Buzz"

fizzbuzz.str:
.asciz "FizzBuzz"
