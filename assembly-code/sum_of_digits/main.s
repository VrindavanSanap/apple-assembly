.global _main // Provide program starting address to linker
.align 4          	 // Make sure everything is aligned properly.

.text
.align 4

_main: 

	// our goal is to sum the digits in x0 and store them in x0
	// expected answer is 15
	mov x0, #12345
	mov x3, x0

	mov x1, #10
	bl _mod_two_values


	bl _exit

