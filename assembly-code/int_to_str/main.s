.global _main    // Provide program starting address to linker
.align 4         // Make sure everything is aligned properly.
.data 
buffer: .ds 100  // Allocate space for the string

.text
.align 4

_get_len:
	// return the length of a integer
	// inputs:
	// x0: given integer
	// outputs:
	// x0: number of digits in x0 

_main:

	mov x0, #123
	// goal is to move int in x0 in its string 
	// representation in to the buffer so we can write 
	// it in stdout
	adrp    x1, buffer@page          
	add     x1, x1, buffer@pageoff   	


//	mov x0, x1
//	mov x1, #2
//	bl _write_stdout
	mov x0, #3
	bl _exit
	