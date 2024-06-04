.global _main
.balign 4
_main:

  mov x0, #1 // stdout = '1'
  // adr = "Address to vector"

  adr x1, hello_world // x1 specifies our string
  mov x2, 14         // x2 specifies how long is our string 
  mov x16, #4        // 4 is write syscall
  svc #0x80          // supervisor call 

  // now exit:
  mov x0, #0
  mov x16, #1  //1 = terminate syscall
  svc #0x80


hello_world: .ascii "Hello world! \n"


