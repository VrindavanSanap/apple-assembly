.global _main    // Provide program starting address to linker
.align 4         // Make sure everything is aligned properly.

.text
.align 4


_main:
	mov x0, #69
	bl _int_to_str
  bl _write_stdout
	bl _exit
