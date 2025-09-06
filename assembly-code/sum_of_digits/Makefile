SDK_PATH := /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.5.sdk

mod_two_values :=/Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/sum_of_digits/mod_two_values.s
all: main.x

main.x: main.o mod_two_values.o
	ld -o main.x main.o mod_two_values.o -lSystem -syslibroot $(SDK_PATH)

mod_two_values.o:
	as $(mod_two_values) -o mod_two_values.o


main.o: main.s
	as main.s -o main.o
