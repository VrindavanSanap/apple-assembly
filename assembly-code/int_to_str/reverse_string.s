// This file lets user input a string from the keyboard,
// reverses the string,
// writes the same string back to the screen,
// and exits the program returning the number of characters read in the exit code.

.global  _reverse_string// Provide program starting address to linker
.align 4             // Make sure everything is aligned properly.

.text
.align 4
_reverse_string:
	// This function reverses the string in the buffer
	// args
	// x0 is the location of buffer
	// x1 is the length of the buffer
	mov x6, x0
	// Store the number of characters read in x3
	mov     x3, x1
	mov 	 x1, x6                // Move buffer address to x1
	sub x4, x3, #2        // Decrement x3 to get the last index
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
	mov x0, x6                 // Increment x0 to point to the buffer address

	mov 	 x1, x3                   // Move number of characters read to x1

	ret