.global _read_stdin
.global _write_stdout
.global _newline
.balign 4

_read_stdin:
	// args
	// x0 is the location of buffer
	// x1 is the length of the buffer
	mov     x16, #3  // 3 is the syscall number for read on macOS
	mov     x2, x1
	mov     x1, x0   // move the buffer to the buffer arg
	mov     x0, 0    // fd for stdin
	svc     #0x80    // Invoke syscall to read string
	ret

_write_stdout:
	// args
	// x0 is the location of buffer
	// x1 is the length of the buffer
	mov     x16, #4  // 4 is the syscall number for write on macOS
	mov     x2, x1
	mov     x1, x0   // move the buffer to the buffer arg
	mov     x0, 1    // fd for stdout
	svc     #0x80    // Invoke syscall to write string
	ret

_newline:
	// args
	sub     sp, sp, #16

	mov     x0, #10
	strb    w0, [sp, #0]

	mov     x16, #4  // 4 is the syscall number for write on macOS

	mov     x2, #1  //length
	mov     x1, sp  // move the buffer to the buffer arg
	mov     x0, 1   // fd for stdout
	svc     #0x80   // Invoke syscall to write string

	add     sp, sp, #16

	ret
