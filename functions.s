.global _main 
.align 2

// Data section
.section __DATA,__data
hello_world: .ascii "Hello world! \n"

// Text section
.section __TEXT,__text
_main:
  bl _hello
  bl _exit

_hello:
  adrp x1, hello_world@PAGE  // Load the page address of the string
  add x1, x1, hello_world@PAGEOFF  // Add the page offset to get the full address
  mov x2, #14                 // x2 specifies the length of our string
  mov x0, #1                  // x0 is the file descriptor (1 = stdout)
  mov x16, #4                 // syscall number for write on macOS
  svc #0                      // supervisor call
  ret

_exit:
  mov x0, #0                  // x0 is the exit code (0 = success)
  mov x16, #1                 // syscall number for exit on macOS
  svc #0                      // supervisor call

