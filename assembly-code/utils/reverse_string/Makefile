SDK_PATH := /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.5.sdk

read_write := /Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/utils/read_write_stdin.s

all: main.x

main.x: main.o read_write_stdin.o reverse_string.o
	ld -o main.x main.o reverse_string.o read_write_stdin.o -lSystem -syslibroot $(SDK_PATH)


main.o: main.s
	as main.s -o main.o
	
reverse_string.o: reverse_string.s
	as reverse_string.s -o reverse_string.o

read_write_stdin.o:
	as $(read_write) -o read_write_stdin.o

clean:
	rm -f *.o *.x