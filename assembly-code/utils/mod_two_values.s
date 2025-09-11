.global _mod_two_values // Provide program starting address to linker
.align 4          	 // Make sure everything is aligned properly.

.text
.align 4

_mod_two_values: 
	// inputs
	// x0 = number to be moded 
	// x1 = number to be moded by 
	// outputs 
	// x0 = x0 % x1

	udiv x2, x0, x1
	mul  x3, x2, x1
	sub  x4, x0, x3
	mov x0, x4


	ret 

