
.global _main // Provide program starting address to linker
.align 4          	 // Make sure everything is aligned properly.

.data 
buffer: .ds 100

.text
.align 4

  
_main: 

	// our goal is to sum the digits in x0 and store them in x0
	// expected answer is 15
	mov x0, #12345
  mov x20, #0
  mov x21, #10

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
  add x20, x20, x0 
  // n = n /10
  udiv x19, x19, x21
  bl _loop
   
_exitt:    
  mov x0, x20
	bl _exit
