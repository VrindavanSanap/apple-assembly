SDK_PATH := $(shell xcrun --sdk macosx --show-sdk-path)

mod_two_values := /Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/utils/mod_two_values.s

all: main.x

main.x: main.o mod_two_values.o
	ld -o main.x main.o mod_two_values.o -lSystem -syslibroot $(SDK_PATH)

mod_two_values.o: $(mod_two_values)
	as $(mod_two_values) -o mod_two_values.o

main.o: main.s
	as main.s -o main.o

clean:
	rm -f *.o *.x