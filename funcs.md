fp = x29 Points to current bottom of stack frame 
lr = x30 Points to the address of the instruction immediately 
         following a function call, indicating where to return 
         after the function completes 
sp = x31 Points to current top of stack frame
pc = x32 Points to address of next instruction 


funcs`main:
    0x100003f68 <+0>: stp    x29, x30, [sp, #-0x10]!
                      store frame pointer and link register
                      at sp -0x10 and subtract 0x10 from sp
                      x29 is stored at address sp -16
                      x30 is stored at address sp -8
                       
    0x100003f6c <+4>:  mov    x29, sp
                       move   stack pointer to frame pointer
                       
    0x100003f70 <+8>:  bl     0x100003f30               ; fun1
                       store the address of the next instruction 
                       ie 0x100003f74 in the link register and  
                       branch to 0x100003f30

    0x100003f74 <+12>: bl     0x100003f4c               ; fun2
                       store the address of the next instruction   
                       ie 0x100003f74 in the link register and  
                       branch to 0x100003f4c               

    0x100003f78 <+16>: mov    w0, #0x0
                       move return value ie zero to w0 register

    0x100003f7c <+20>: ldp    x29, x30, [sp], #0x10
                       load x29 from sp and x30 from sp + 8
                       sp = sp + 16

    0x100003f80 <+24>: ret    
                       jump to link register

(lldb) disass --name fun1
funcs`fun1:
    0x100003f30 <+0>:  stp    x29, x30, [sp, #-0x10]!
                       store frame pointer and link register
                       at sp -0x10 and subtract 0x10 from sp
                       x29 is stored at address sp -16
                       x30 is stored at address sp -8
 
    0x100003f34 <+4>:  mov    x29, sp
                       move   stack pointer to frame pointer

    0x100003f38 <+8>:  adrp   x0, 0
                       calculate the address of the 4KB page 
                       containing the address 0 and stores the 
                       result in x0.

    0x100003f3c <+12>: add    x0, x0, #0xf90 ; "From fun1\n"
                       add 0xf90 to x0 (location where "From fun1"
                       is stored)

    0x100003f40 <+16>: bl     0x100003f84    ; printf
                       call printf
    0x100003f44 <+20>: ldp    x29, x30, [sp], #0x10
                       load x29 from sp and x30 from sp + 8
                       sp = sp + 16
    0x100003f48 <+24>: ret    
                       jump to link register

(lldb) disass --name fun2
funcs`fun2:
    0x100003f4c <+0>:  stp    x29, x30, [sp, #-0x10]!
    0x100003f50 <+4>:  mov    x29, sp
    0x100003f54 <+8>:  adrp   x0, 0
                       calculate the address of the 4KB page 
                       containing the address 0 and stores the 
                       result in x0.

    0x100003f58 <+12>: add    x0, x0, #0xf9b ; "From fun2\n"
    0x100003f5c <+16>: bl     0x100003f84    ; printf
    0x100003f60 <+20>: ldp    x29, x30, [sp], #0x10
    0x100003f64 <+24>: ret    

