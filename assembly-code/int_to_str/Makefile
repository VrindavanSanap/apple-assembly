SDK_PATH := /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.5.sdk


read_write := /Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/utils/read_write_stdin.s

get_last_digit := /Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/utils/get_last_digit.s

mod_two_val := /Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/utils/mod_two_values_msub.s

all: main.x

main.x: main.o read_write_stdin.o get_last_digit.o mod_two_values_msub.o
	ld -o main.x main.o read_write_stdin.o get_last_digit.o mod_two_values_msub.o -lSystem -syslibroot $(SDK_PATH)


main.o: main.s
	as main.s -o main.o
	

read_write_stdin.o:
	as $(read_write) -o read_write_stdin.o

get_last_digit.o:
	as $(get_last_digit) -o get_last_digit.o

mod_two_values_msub.o:
	as $(mod_two_val) -o mod_two_values_msub.o