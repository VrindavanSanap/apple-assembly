// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Read in from keyboard and print to the screen
//
// NOTE: This example uses system and kernel calls
//       to read from the keyboard and write to
//       the screen. It does not use printf or
//       scanf (which are shown in other examples).
//
// COMPILE  -->  make
// RUN      -->  ./filename
// ------------------------------------------------
.global _main
.align 2


_main:
                          // read in from keyboard
mov x16, 3                // tell system we want to read from stdin (#3)
mov x0, 0                 // focus on the keyboard (#0)
mov x2, 20                // define length of string to read in
adrp  x1, msg@page        // load the address of the message
add x1, x1, msg@pageoff   // store the address to x1
svc 0                     // call kernel to perform the action
bl _write
bl _end

_write:
mov x16, 4                // tell system we want to write to stdout (#4)
mov x0, 1                 // focus on the screen (#1)
adrp  x1, msg@page        // load the address of the message
add x1, x1, msg@pageoff   // store the address to x1
svc 0                     // call kernel to perform the action
ret

_end:
mov x0, 0                 // return 0 (get a run error without this)
mov x16, 1                // system call to terminate this program
svc 0                     // call kernel to perform the action

.data
msg:
.ds 20                    // 20 bytes of memory for keyboard input