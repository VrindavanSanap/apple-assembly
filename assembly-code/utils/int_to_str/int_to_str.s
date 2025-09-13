.global _int_to_str
.align 4         // Make sure everything is aligned properly.

.data 
buffer: .ds 100  // Allocate space for the string
.text
.align 4

_int_to_str:
	// given
	// arg0: x0 (given integer which we have to covert to string)
	// arg1: x1 (buffer where we want to store the resulting string)

	// output
	// arg0: x0 (result buffer)
	// arg1: x1 (length of result buffer)

	stp     x29, x30, [sp, #-16]!
	adrp    x23, buffer@page
	add     x23, x23, buffer@pageoff   	
  mov x20, #0
  mov x21, #10
  mov x24, #0
  // registers x19-x28 are calle saved hence can be used to store
  // stuff before calling a function.
  mov x19, x0

_loop:
  // n = x19
  mov x0, x19
  // while n != 0
  cmp x0, 0
  beq _exitt
	mov x1, #10
	bl _mod_two_values
  // res = x20
  // res += n%10
  add x20, x0 ,#48
  strb w20, [x23, x24]
  add x24, x24, #1
  // n = n /10
  udiv x19, x19, x21
  b _loop
   
_exitt:    
	mov w20, #10
	strb w20, [x23, x24]
	add x24, x24, #1
	mov x0, x23
  mov x1, x24
  bl _reverse_string
  bl _write_stdout
	ldp x29, x30, [sp], #16
	ret
