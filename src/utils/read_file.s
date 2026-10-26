// read_file.s
// created by Vrindavan Sanap
// reads a text file and returns it to memory, mapped using mmap

.global _read_file
.align 4

_read_file:
	// inputs
	// x0: file_name
	// outputs
	// x0: memory address to start of memory that maps the text file
	// x1: size of the file in bytes

	stp     x29, x30, [sp, #-32]!
	str     x19, [sp, 16]
	str     x20, [sp, 24]

	mov     x29, sp
	mov     x1, #0
	mov     x2, #0
	mov     x16, #5
	svc     #0x80

	// x0 contains  the fd
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

	mov     x1, x20

Lread_file_exit:
	ldr     x19, [sp, 16]
	ldr     x20, [sp, 24]
	ldp     x29, x30, [sp], #32

	ret

.section __TEXT, __cstring
failed_msg:
.asciz "Reading file failed!\n"
.equ failed_msg_len, . - failed_msg - 1
