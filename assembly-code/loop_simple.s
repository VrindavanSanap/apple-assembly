.global _main
.align 2


_main: 
	mov x0, 0
	mov x1, 1
	bl _continue_loop
  bl _end

_loop:
  add x0, x0, x1				// Add X1 to X0 and store in X0


_continue_loop:
	cmp x0, 9         // Does X0 = 9?
	B.LE	_loop				// If <=, the loop


_end:
	mov x16, 1					// System call to terminate this program
	svc 0						    // Call kernel to perform the action
