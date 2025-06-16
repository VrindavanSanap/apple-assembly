.global _main // Provide program starting address to linker
.align 4      // Make sure everything is aligned properly.
.data 
buffer: .ds 100 // Allocate space for the string

.text
.align 4


_main:
	// load buffer address into x0
	adrp    x0, buffer@page          
	add     x0, x0, buffer@pageoff   
	// load buffer length into x1 
	mov     x1, #100             
	bl _read_stdin        
	mov x1, x0
	// load buffer address into x0
	adrp    x0, buffer@page          
	add     x0, x0, buffer@pageoff   
	// load buffer length into x1 
	bl _reverse_string


	bl _write_stdout
	bl _exit
	