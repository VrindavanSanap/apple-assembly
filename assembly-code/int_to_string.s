// this files convert a int value from a register to a string 

.global _main // Provide program starting address to linker
.align 4      // Make sure everything is aligned properly.
.data 
buffer: .ds 100 // Allocate space for the string

.text
.align 4

_main:
	mov x16, 3                // tell system we want to read from stdin (#3)
	mov x0, 0                 // focus on the keyboard (#0)
	mov x2, 100                // define length of string to read in
	adrp  x1, buffer@page        // load the address of the message
	add x1, x1, buffer@pageoff   // store the address to x1
	svc #0x80              // invoke syscall to read string     

  mov x16, #1     // #1 is the syscall number for exit on macOS
  svc #0x80       // Invoke syscall for exit
