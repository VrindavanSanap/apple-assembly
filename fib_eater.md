wzr  = widend zero register (32 bit zero register)
fp = frame pointer(x29)
lr = link register(x30)
sp = stack pointer(x31) 
  So, in Apple Silicon:
  
  Direction of Stack Growth: 
    Downward (From higher memory address to lower memory
              address)

  When items are pushed onto the stack:
    The stack pointer (SP) is decremented to 
    allocate space for new items.

  When items are popped from the stack:
    The stack pointer (SP) is incremented as 
    items are removed.

pc = program counter(x32) 


->  0x100003f18 <+0>:   sub    sp, sp, #0x30
    decrement sp by 48 (0x30 in hexadecimal) 
    to create space on the stack

    0x100003f1c <+4>:   stp    x29, x30, [sp, #0x20]  

    0x100003f20 <+8>:   add    x29, sp, #0x20
    0x100003f24 <+12>:  stur   wzr, [x29, #-0x4]
    0x100003f28 <+16>:  b      0x100003f2c               ; <+20>
    0x100003f2c <+20>:  stur   wzr, [x29, #-0x8]
    0x100003f30 <+24>:  mov    w8, #0x1
    0x100003f34 <+28>:  stur   w8, [x29, #-0xc]
    0x100003f38 <+32>:  b      0x100003f3c               ; <+36>
    0x100003f3c <+36>:  ldur   w9, [x29, #-0x8]
    0x100003f40 <+40>:  mov    x8, x9
    0x100003f44 <+44>:  mov    x9, sp
    0x100003f48 <+48>:  str    x8, [x9]
    0x100003f4c <+52>:  adrp   x0, 0
    0x100003f50 <+56>:  add    x0, x0, #0xfa0            ; "%d \n"
    0x100003f54 <+60>:  bl     0x100003f94               ; symbol stub for: printf
    0x100003f58 <+64>:  ldur   w8, [x29, #-0x8]
    0x100003f5c <+68>:  ldur   w9, [x29, #-0xc]
    0x100003f60 <+72>:  add    w8, w8, w9
    0x100003f64 <+76>:  str    w8, [sp, #0x10]
    0x100003f68 <+80>:  ldur   w8, [x29, #-0xc]
    0x100003f6c <+84>:  stur   w8, [x29, #-0x8]
    0x100003f70 <+88>:  ldr    w8, [sp, #0x10]
    0x100003f74 <+92>:  stur   w8, [x29, #-0xc]
    0x100003f78 <+96>:  b      0x100003f7c               ; <+100>
    0x100003f7c <+100>: ldur   w8, [x29, #-0x8]
    0x100003f80 <+104>: subs   w8, w8, #0xff
    0x100003f84 <+108>: cset   w8, lt
    0x100003f88 <+112>: tbnz   w8, #0x0, 0x100003f3c     ; <+36>
    0x100003f8c <+116>: b      0x100003f90               ; <+120>
    0x100003f90 <+120>: b      0x100003f2c               ; <+20>

