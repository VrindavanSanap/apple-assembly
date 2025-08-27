.section	__TEXT,__text,regular,pure_instructions
.global _get_last_digit

_get_last_digit:
	// args
	// x0 is the number whose last digit we want to get
	// returns
	// x0 is the last digit of the number
	mov x1, #10 // divisor
	bl _mod_two_val
	ret