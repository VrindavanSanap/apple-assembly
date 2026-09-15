// This file lets user input a string from the keyboard,
// reverses the string,
// writes the same string back to the screen,
// and exits the program returning the number of characters read in the exit code.

.global  _reverse_string        // Provide program starting address to linker
.align   4                     // Make sure everything is aligned properly.

.text
.align   4

_reverse_string:
	// This function reverses the string in the buffer
	// args:
	//   x0 - location of buffer
	//   x1 - length of the buffer

	mov     x6, x0              // Save buffer address
	mov     x3, x1              // Store the number of characters read in x3
	mov     x1, x6              // Move buffer address to x1
	sub     x4, x3, #2          // Decrement x3 to get the last index (exclude newline/terminator)
	mov     x2, #0              // Initialize index to 0

_loop:
	ldrb    w0, [x1, x2]        // Load byte at start index
	ldrb    w5, [x1, x4]        // Load byte at end index
	strb    w0, [x1, x4]        // Store start byte at end index
	strb    w5, [x1, x2]        // Store end byte at start index
	add     x2, x2, #1          // Increment start index
	sub     x4, x4, #1          // Decrement end index
	cmp     x2, x4              // Compare indices
	ble     _loop               // Loop if start <= end

	mov     x0, x6              // Restore buffer address to x0
	mov     x1, x3              // Move number of characters read to x1

	ret