# Get the macOS SDK path dynamically instead of hardcoding it.
# This makes the Makefile more portable across different machines and Xcode versions.
SDK_PATH := $(shell xcrun --sdk macosx --show-sdk-path)

# Define source files, object files, and the final target executable.
READ_WRITE_SRC := /Users/vrindavan/Code/languages/assembly/apple-assembly/assembly-code/utils/read_write_stdin.s
OBJS := main.o read_write_stdin.o int_to_char.o
TARGET := main.x

# .PHONY declares targets that are not actual files.
# This prevents 'make' from getting confused if a file named 'all' or 'clean' exists.
.PHONY: all clean

# The 'all' target is the default goal, executed when you just run 'make'.
# It builds the target and then runs it.
all: $(TARGET)
	./$(TARGET)

# Rule to link the final executable from all the object files.
# '$@' is an automatic variable for the target name (main.x).
# '$^' is an automatic variable for all the prerequisites (the .o files).
$(TARGET): $(OBJS)
	ld -o $@ $^ -lSystem -syslibroot $(SDK_PATH)

# A pattern rule to assemble any .s file into a .o file.
# '$<' is an automatic variable for the first prerequisite (the source .s file).
%.o: %.s
	as $< -o $@

# Rule to assemble the read_write_stdin utility.
# This is a specific rule because the source is in a different directory.
read_write_stdin.o: $(READ_WRITE_SRC)
	as $< -o $@

# Rule to clean up all generated files (objects and the executable).
clean:
	rm -f $(OBJS) $(TARGET)
