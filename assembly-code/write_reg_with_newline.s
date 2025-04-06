.global _main

.text

_newline:

   // Load a value into x0  and convert to ASCII
  mov x0, #10
  // Allocate memory on the stack and store char
  sub sp, sp, #16   
  // Perfrom the write syscall (x0-fd, x1-buffer, x2-size)
  str x0, [sp]      
  mov x0, #1   //fd
  mov x1, sp   //buffer 
  mov x2, #1   //size     
  mov x16, #0x4    
  svc #0            
  ret


_main:
  // Load a value into x0  and convert to ASCII
  mov x0, #2
  add x0, x0, #'0' 
  
  // Allocate memory on the stack and store char
  sub sp, sp, #16   

  // Perfrom the write syscall (x0-fd, x1-buffer, x2-size)
  str x0, [sp]      
  mov x0, #1   //fd
  mov x1, sp   //buffer 
  mov x2, #1   //size     
  mov x16, #0x4    
  svc #0            


  bl _newline
  // Perfrom the exit syscall (x0-status, )
  mov x0, #0        
  mov x16, #0x1     
  svc #0           

