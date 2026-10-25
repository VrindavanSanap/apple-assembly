// read_file.s
// created by Vrindavan Sanap
// write the contents of the file to stdout

.global _main
.align 4
_main:

	stp     x29, x30, [sp, #-32]!
	str     x19, [sp, 16]
	str     x20, [sp, 24]

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
	//	 x0 contains  the fd
	mov     x19, x0
	//	lseek syscall
	mov     x1, #0
	mov     x2, #2
	mov     x16, #199
	svc     #0x80
	mov     x20, x0

	//	mmap syscall
	mov     x0, 0    // NULL
	mov     x1, x20  // size
	mov     x2, #1   // PROT_READ
	mov     x3, #2   // MAP_PRIVATE
	mov     x4, x19  // fd
	mov     x5, #0
	mov     x16, #197
	svc     #0x80

	//	write syscall
	mov     x1, x20
	bl      _write_stdout

Lmain_exit:
	ldr     x19, [sp, 16]
	ldr     x20, [sp, 24]

	ldp     x29, x30, [sp], #32

	mov     x0, #0
	ret

.section __TEXT, __cstring
file_name:
.asciz "file.txt"
failed_msg:
.asciz "Reading file failed!\n"
.equ failed_msg_len, . - failed_msg - 1
