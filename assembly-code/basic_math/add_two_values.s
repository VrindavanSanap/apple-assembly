.global _main
.align 4

_main: 
	; move 20 to the x0 register
  mov x0, #20       // C++ long x0 = 20

	; add 22 to x0 and save the result in x0
	add x0, x0, #22   // C++ x0 += 22

	; set x16 to 1 (syscall number for exit)
  mov x16, #1       // move 1 into 64 bit x16 
                    // register read by os

	; supervisor  make the system call happen hence exit the program
	svc 0             // supervisor call
  
