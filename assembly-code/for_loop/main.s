.global _main    // Provide program starting address to linker
.align 4         // Make sure everything is aligned properly.

.text
.align 4


_main:

_start:

	mov x19, #0
  mov x21, #10

  //sum = #0
	mov x20, #0

_loop:
  add x20, x20, x19
  cmp x19, x21
  beq _exit
  add x19, x19, #1
  b _loop

_exit:
	mov x0, x20
	mov x16, #1
	svc 0
