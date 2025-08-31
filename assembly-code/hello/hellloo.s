
.global _main
.align 4


_main:
    mov x2, #0
    mov x3, len
loop:
    cmp x2, x3 
    b.cs end_loop
    add x2, x2, 1
    mov x0, #1
    adr x1, helloworld
    mov x16, #4
    svc #0x80
    b loop

end_loop:

    mov x0, #0
    mov x16, #1
    svc #0x80

helloworld: .ascii "\n Hello World!"
.equ len, . - helloworld