.global _int_to_char

.text
.align 4

_int_to_char:
	// inputs
	// x0 = given int
	// outputs
	// x0 = ASCII code of the given int
	add     x0, x0, #'0'

	ret
