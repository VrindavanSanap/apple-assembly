.section .rodata
mesg: .asciz "Hello World\n"
.text
.global main_

main_:
stp x29, x30, [sp, #-16]!
// printf("Hello World\n")
adr     x0, mesg
bl      printf
// return 0
mov w0, #0
ldp x29, x30, [sp], #16 
ret
.size main,(. - main)
