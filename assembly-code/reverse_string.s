// This file lets user input a string from the keyboard,
// reverses the string,
// writes the same string back to the screen,
// and exits the program returning the number of characters read in the exit code.

.global _main        // Provide program starting address to linker
.align 4             // Make sure everything is aligned properly.

.data
buffer: .ds 100      // Allocate space for the string

.text
.align 4

_main:
	// Read input from stdin
	mov     x16, #3                  // 3 is the syscall number for read on macOS
	mov     x0, #0                   // fd for stdin
	mov     x2, #100                 // Length of string to read in
	adrp    x1, buffer@page          // Load the address of the buffer (page)
	add     x1, x1, buffer@pageoff   // Add page offset to get full address
	svc     #0x80                    // Invoke syscall to read string

	// Store the number of characters read in x3
	mov     x3, x0

	// Load the base address of the buffer again
	adrp    x1, buffer@page
	add     x1, x1, buffer@pageoff

	sub x4, x3, #2               // Decrement x3 to get the last index

	// Reverse the string
	mov 	 x2, #0                   // Initialize index to 0
_loop:
	//swap digits
	ldrb    w0, [x1, x2] 
	ldrb    w5, [x1, x4] 
	strb		w0, [x1, x4]             
	strb		w5, [x1, x2]             
	
	add     x2, x2, #1               // Increment index
	sub 		x4, x4, #1               // Decrement last index
	cmp     x2, x4                   // Compare index with number of characters read
	ble     _loop                    // If not equal, loop again

	// Write input back to stdout

	mov     x0, #1                   // fd for stdout
	mov     x2, #100                 // Length of string to write out
	mov     x16, #4                  // 4 is the syscall number for write on macOS
	svc     #0x80                    // Call kernel to output the string


	// Exit program
	mov     x0, x3                   // x0 is the exit code (number of characters read)
	mov     x16, #1                  // 1 is the syscall number for exit on macOS
	svc     #0x80                    // Invoke syscall for exit
