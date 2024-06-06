int add(int a, int b) {
    int result = a + b;
    return result;
}

int main() {
    int x = 5;
    int y = 7;
    int sum = add(x, y);
    return 0;
}


(lldb) disass
add`main:
    
    
->  0x100003f54 <+0>:  sub    sp, sp, #0x30
    
    0x100003f58 <+4>:  stp    x29, x30, [sp, #0x20]
    0x100003f5c <+8>:  add    x29, sp, #0x20
    0x100003f60 <+12>: mov    w8, #0x0
    0x100003f64 <+16>: str    w8, [sp, #0xc]
    0x100003f68 <+20>: stur   wzr, [x29, #-0x4]
    0x100003f6c <+24>: mov    w8, #0x5
    0x100003f70 <+28>: stur   w8, [x29, #-0x8]
    0x100003f74 <+32>: mov    w8, #0x7
    0x100003f78 <+36>: stur   w8, [x29, #-0xc]
    0x100003f7c <+40>: ldur   w0, [x29, #-0x8]
    0x100003f80 <+44>: ldur   w1, [x29, #-0xc]
    0x100003f84 <+48>: bl     0x100003f2c               ; add
    0x100003f88 <+52>: mov    x8, x0
    0x100003f8c <+56>: ldr    w0, [sp, #0xc]
    0x100003f90 <+60>: str    w8, [sp, #0x10]
    0x100003f94 <+64>: ldp    x29, x30, [sp, #0x20]
    0x100003f98 <+68>: add    sp, sp, #0x30
    0x100003f9c <+72>: ret    
(lldb) dissass --name add
error: 'dissass' is not a valid command.
(lldb) disass --name add
add`add:
    0x100003f2c <+0>:  sub    sp, sp, #0x10
    0x100003f30 <+4>:  str    w0, [sp, #0xc]
    0x100003f34 <+8>:  str    w1, [sp, #0x8]
    0x100003f38 <+12>: ldr    w8, [sp, #0xc]
    0x100003f3c <+16>: ldr    w9, [sp, #0x8]
    0x100003f40 <+20>: add    w8, w8, w9
    0x100003f44 <+24>: str    w8, [sp, #0x4]
    0x100003f48 <+28>: ldr    w0, [sp, #0x4]
    0x100003f4c <+32>: add    sp, sp, #0x10
    0x100003f50 <+36>: ret    

