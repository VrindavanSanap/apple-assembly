.global _main
_main:
    mov    x0,  #1234      // our starting number
    mov    x20, #0         // sum = 0

_loop:
    mov    x19,  x0         // save current number in a caller-saved reg
    bl     _get_last_digit // returns digit in x0
    add    x20, x20, x0    // sum += last digit

    mov    x0,  x19         // restore original number
    mov    x3,  #10        // divisor
    udiv   x0,  x0, x3     // x0 /= 10
    cbnz   x0,  _loop      // branch if x0 != 0

    mov    x0,  x20        // move sum into x0 for return
    bl     _exit
