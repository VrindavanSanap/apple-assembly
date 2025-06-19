    .global _main                                                        // 1 
    .text                                                               // 2 
                                                                        // 3 
_main:                                                                   // 4 
  
    // stores the frame pointer and return address on the stack while 
    // adjusting the stack pointer to create a new stack frame.
    stp     x29, x30, [sp, -16]!                                        // 5 

    // assume a = x0 and b = x1
    mov     x0, 5                                                       // 6
    mov     x1, 10                                                      // 7 
                                                                        // 8 
    
    // if x0 < x1 jump to 1:
    cmp     x0, x1                                                      // 9 
    ble     1f                                                          // 10 

    // else 
    // load the address of "TRUE"
    adrp    x0, T@PAGE
    add     x0, x0, T@PAGEOFF

    // print
    bl      _puts                                                        // 12 
    // exit
    b       2f                                                          // 13 
                                                                        // 14 
1:  

    // load the address of "TRUE"
    adrp    x0, F@PAGE
    add     x0, x0, F@PAGEOFF
    bl      _puts                                                        // 16 
                                                                        // 17 

  
2: 
    // load the stack and frame pointer of previous frame and exit
    ldp     x29, x30, [sp], 16                                          // 18 
    mov     x0, xzr                                                     // 19 
    ret                                                                 // 20 
                                                                        // 21 
    .data                                                               // 22 
F:  .asciz  "FALSE"                                                     // 23 
T:  .asciz  "TRUE"                                                      // 24 
                                                                        // 25 
    .end                                                                // 26 
