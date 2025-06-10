// this files convert a int value from a register to a string 


.global _main // Provide program starting address to linker
.align 4      // Make sure everything is aligned properly.
.data 
buffer: .ds 100 // Allocate space for the string

.text
.align 4

_main:
	// Our goal it to convert an integer to a string
	mov x0, #1234 // integer to convert


	adrp x0, buffer@page          
	add x0, x0, buffer@pageoff 
	mov x1, 100
	bl read_console

	mov x1, x0
	adrp x0, buffer@page          
	add x0, x0, buffer@pageoff 

	bl reverse_string
	
	bl write_console

	bl exit
reverse_string:
	// Purpose: reverses a given string
	// Inputs:
	// arg0-x0 address of given string
	// arg1-x1 size of given string
	// Ouputs:
	// returns the reversed string in x0


	sub x1, x1, #2 // decreement size to get the last index
	mov x2, 0 		 // initalise the first index


	ret


uitoa:
	// Purpose: Convert an unsigned integer to a string (base10)
	// Inputs:
	// arg0-x0 integer to be converted
	// arg1-x1 address to store the string
	// outputs:	
	// returns the string in x0
	
	ret



read_console:
	// reads input form the console using read syscall
	// read_sys(int fd, const void buff[.count], size_t count);
	// arg0-x0  address to store the string
	// arg1-x1  buffer size

	// returns number of bytes read in x0
	mov x2, x1
	mov x1, x0
	mov x0, #0
	mov x16, 3                // # for write syscall (#3)

	svc #0x80              // invoke syscall to read string     
	ret

write_console:
	// writes given string to console using write syscall
	// write_sys(int fd, const void buff[.count], size_t count);
	// arg0-x0 address of given string	
	// arg1-x1 length of string
	// returns number of bytes written in x0
	mov x2, x1
	mov x1, x0
	mov x0, #1  	//fd for stdout
	mov x16, 4                // # for write syscall (#3)
	svc #0x80              // invoke syscall to read string     
	ret


exit:
	// Purpose: exits the program
	// Inputs:
	// arg0-x0 exit code


  mov x16, #1     // #1 is the syscall number for exit on macOS
  svc #0x80       // Invoke syscall for exit



