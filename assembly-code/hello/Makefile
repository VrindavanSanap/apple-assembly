SDK_PATH := $(shell xcrun --sdk macosx --show-sdk-path)
read_write := ../utils/read_write_stdin.s

all: hello.x hello_5.x hello_n.x hellloo.x

hello.x: hello.o
	ld -o hello.x hello.o -lSystem -syslibroot $(SDK_PATH)

hello_5.x: hello_5.o read_write_stdin.o
	ld -o hello_5.x hello_5.o read_write_stdin.o -lSystem -syslibroot $(SDK_PATH)

hello_n.x: hello_n.o read_write_stdin.o
	ld -o hello_n.x hello_n.o read_write_stdin.o -lSystem -syslibroot $(SDK_PATH)

hellloo.x: hellloo.o
	ld -o hellloo.x hellloo.o -lSystem -syslibroot $(SDK_PATH)

read_write_stdin.o: $(read_write)
	as $(read_write) -o read_write_stdin.o

hello.o: hello.s
	as hello.s -o hello.o

hello_5.o: hello_5.s
	as hello_5.s -o hello_5.o

hello_n.o: hello_n.s
	as hello_n.s -o hello_n.o

hellloo.o: hellloo.s
	as hellloo.s -o hellloo.o

clean:
	rm -f *.o *.x
