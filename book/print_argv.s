    .global _main                                                   // 1 
                                                                    // 2 
_main:                                                              // 3 
    // store pair
    // [sp, -16]! means decrement sp BEFORE performing op [predecrement]

    stp     x21, x30, [sp, -16]!    // push onto stack              // 4 
    mov     x21, x1                 // argc -> x0, argv -> x1       // 5 
                                                                    // 6 
    top:                                                            // 7 
    ldr     x0, [x21], 8            // argv++, old value in x0      // 8 
    cbz     x0, bottom              // if *argv == NULL goto bottom // 9 
    bl      _puts                    // puts(*argv)                 // 10 
    b       top                     // goto top                     // 11 
                                                                    // 12 
    bottom:                                                         // 13 
    ldp     x21, x30, [sp], 16      // pop from stack               // 14 
    mov     x0, xzr                 // return 0                     // 15 
    ret                                                             // 16 
                                                                    // 17 
    .end                                                            // 18 
