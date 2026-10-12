// 10.s
// created by Vrindavan Sanap
// counts number of digits in 69420
// and writes it to the exit code

.global _main
.align 2

_main:
	mov     x0, #1
	ldr     x1, =69420
	mov     x3, #10

_loop:
	cmp     x1, #10
	b.lt    _exit
	udiv    x1, x1, x3
	add     x0, x0, #1
	b       _loop

_exit:
	mov     x16, #1
	svc     #80
