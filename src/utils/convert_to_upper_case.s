// This file lets user input a string from the keyboard,
// converts it to upper case and then,
// writes the same string back to the screen,
// and exits the program returning the number of characters read in the exit code.

.global _main           // Provide program starting address to linker
.align 4                // Make sure everything is aligned properly.

.data
buffer: .ds 100         // Allocate space for the string

.text
.align 4

_main:
	// Read input from stdin
	mov     x16, #3                     // 3 is the syscall number for read on macOS
	mov     x0, #0                      // fd for stdin
	mov     x2, #100                    // Length of string to read in
	adrp    x1, buffer@page             // Load the address of the buffer (page)
	add     x1, x1, buffer@pageoff      // Add page offset to get full address
	svc     #0x80                       // Invoke syscall to read string

	// Store the number of characters read in x3
	mov     x3, x0

	// Load the base address of the buffer again
	adrp    x1, buffer@page
	add     x1, x1, buffer@pageoff

	// Convert to upper case
	// Loop through each character in the buffer
	mov     x2, #0                      // Initialize index to 0
	sub     x3, x3, #1                  // Decrement x3 to get the last index

_loop:
	ldrb    w0, [x1, x2]                // Load the character at index x2
	cmp     w0, #'a'                    // Compare with 'a'
	b.lt    _skip                       // If less than 'a', skip conversion
	cmp     w0, #'z'                    // Compare with 'z'
	b.gt    _skip                       // If greater than 'z', skip conversion
	sub     w0, w0, #32                 // Convert to upper case by subtracting 32
	strb    w0, [x1, x2]                // Store the converted character back

_skip:
	add     x2, x2, #1                  // Increment index
	cmp     x2, x3                      // Compare index with number of characters read
	b.ne    _loop                       // If not equal, loop again

	// Write input back to stdout
	mov     x0, #1                      // fd for stdout
	mov     x2, #100                    // Length of string to write out
	mov     x16, #4                     // 4 is the syscall number for write on macOS
	svc     #0x80                       // Call kernel to output the string

	add     x3, x3, #1                  // Restore x3 to original value

	// Exit program
	mov     x0, x3                      // x0 is the exit code (number of characters read)
	mov     x16, #1                     // 1 is the syscall number for exit on macOS
	svc     #0x80                       // Invoke syscall for exit
