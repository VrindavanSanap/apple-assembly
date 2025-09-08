.global _int_to_str
.align 4         // Make sure everything is aligned properly.

.data 
buffer: .ds 100  // Allocate space for the string
.text
.align 4

_int_to_str:
	adrp    x23, buffer@page          
	add     x23, x23, buffer@pageoff   	

  // our goal is to sum the digits in x0 and store them in x0
	// expected answer is 15
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
  add x24, x24, #1
  beq _exitt
	mov x1, #10
	bl _mod_two_val
  // res = x20
  // res += n%10
  add x20, x0 ,#48
  strb w20, [x23, x24]
  add x24, x24, #1
  // n = n /10
  udiv x19, x19, x21
  bl _loop
   
_exitt:    
  mov x0, x23
  mov x1, x24
  bl _reverse_string
  bl  _write_stdout
  mov x0, x20

	bl _exit
