.global _int_to_char // Provide program starting address to linker
.align 4          	 // Make sure everything is aligned properly.

.text
.align 4

_int_to_char: 
	// inputs
	// x0 = given int
	// outputs 
	// x0 = ascci code of the given int
	add x0, x0, #48

	ret 

