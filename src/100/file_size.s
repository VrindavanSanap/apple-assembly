// file_size.s
// created by Vrindavan Sanap
// write the number of bytes in a given file to stdout

.global _main
.align 4
_main:

	stp     x29, x30, [sp, #-32]!
	mov     x29, sp
	adrp    x0, file_name@PAGE
	add     x0, x0, file_name@PAGEOFF
	mov     x1, #0
	mov     x2, #0
	mov     x16, #5
	svc     #0x80

	b.cs    Lread_fail
	b       Lread_success

Lread_fail:
	adrp    x0, failed_msg@PAGE
	add     x0, x0, failed_msg@PAGEOFF
	ldr     x1, =failed_msg_len
	bl      _write_stdout
	b       Lmain_exit

Lread_success:
	//	lseek syscall
	mov     x1, #0
	mov     x2, #2
	mov     x16, #199
	svc     #0x80



	bl      _uitoa
	bl      _write_stdout
	bl      _newline

Lmain_exit:
	ldp     x29, x30, [sp], #32
	mov     x0, #0
	ret

.section __TEXT, __cstring
file_name:
.asciz "bee.txt"
failed_msg:
.asciz "Reading file failed!\n"
.equ failed_msg_len, . - failed_msg - 1
