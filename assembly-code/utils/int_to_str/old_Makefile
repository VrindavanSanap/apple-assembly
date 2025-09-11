SDK_PATH := /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.5.sdk


read_write := /Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/utils/read_write_stdin.s

get_last_digit := /Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/utils/get_last_digit.s

mod_two_val := /Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/utils/mod_two_values_msub.s

reverse_string := /Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/utils/reverse_string/reverse_string.s

int_to_str := /Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/utils/int_to_str/int_to_str.s
all: main.x


main.x: main.o int_to_str.o read_write_stdin.o get_last_digit.o mod_two_values_msub.o reverse_string.o
	ld -o main.x main.o int_to_str.o read_write_stdin.o get_last_digit.o mod_two_values_msub.o reverse_string.o -lSystem -syslibroot $(SDK_PATH)


main.o: main.s
	as main.s -o main.o
	
reverse_string.o:
	as $(reverse_string) -o reverse_string.o

read_write_stdin.o:
	as $(read_write) -o read_write_stdin.o
mod_two_values_msub.o:
	as $(mod_two_val) -o mod_two_values_msub.o

int_to_str.o:
	as $(int_to_str) -o int_to_str.o

get_last_digit.o:
	as $(get_last_digit) -o get_last_digit.o
clean:
	rm -f *.o *.x
