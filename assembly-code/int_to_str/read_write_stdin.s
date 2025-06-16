


.global _read_stdin 
.global _write_stdout 
.balign 4

_read_stdin:
	// args
	// x0 is the location of buffer 
	// x1 is the length of the buffer
	mov x16, #3                  // 3 is the syscall number for read on macOS
	mov x2, x1
	mov x1, x0 // move the buffer to the buffer arg
	mov x0, 0 // fd for stdin
	svc #0x80                    // Invoke syscall to read string
	ret

_write_stdout:
	// args
	// x0 is the location of buffer 
	// x1 is the length of the buffer
	mov x16, #4                  // 4 is the syscall number for read on macOS
	mov x2, x1
	mov x1, x0 // move the buffer to the buffer arg
	mov x0, 0 // fd for stdin
	svc #0x80                    // Invoke syscall to read string
	ret









	
