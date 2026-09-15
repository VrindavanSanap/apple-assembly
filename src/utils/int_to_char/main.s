.global _main    // Provide program starting address to linker
.align 4         // Make sure everything is aligned properly.
.data 
buffer: .ds 100  // Allocate space for the string

.text
.align 4

_main: 
	// we want to convert integer in x0 to char '4'

	mov x0, #4
	bl _int_to_char
	mov x1, x0
	adrp    x0, buffer@page          
	add     x0, x0, buffer@pageoff   

	str x1, [x0]
	mov x1, #2
	bl _write_stdout
	mov x0, #0
	bl _exit



