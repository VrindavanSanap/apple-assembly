# Makefile for main.s

# Define the assembler and linker
AS = as
LD = ld

# Define the target executable name
TARGET = fizz_buzz_asm

# Define the source file
SRCS = main.s
OBJS = main.o read_write.o

# Define SDK_PATH
SDK_PATH = $(shell xcrun --sdk macosx --show-sdk-path)

# Default target
all: $(TARGET)

# Rule to assemble the source file
main.o: $(SRCS)
	$(AS) -o main.o $(SRCS)

read_write := /Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/utils/read_write_stdin.s

read_write.o: $(read_write)
	$(AS) -o read_write.o $(read_write)


# Rule to link the object file
$(TARGET): $(OBJS)
	$(LD) -o $(TARGET) $(OBJS)  -lSystem -syslibroot $(SDK_PATH) -e _main -arch arm64

# Rule to run the executable
run: $(TARGET)
	./$(TARGET)

# Rule to clean up generated files
clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: all clean run
