# Makefile to link each .o file into its own .x executable with all other .o files

SDK_PATH := /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.5.sdk

# Collect all .s files
SRC := $(wildcard *.s)

# Convert to object and executable names
OBJ := $(SRC:.s=.o)
OUT := $(OBJ:.o=.x)

# Default target: build all .x files
all: $(OUT)

# Rule: For each .x, link corresponding .o with all other .o files
%.x: %.o $(filter-out %.o,$(OBJ))
	ld -o $@ $^ -lSystem -syslibroot $(SDK_PATH)

# Rule: Assemble .s into .o
%.o: %.s
	as $< -o $@

# Clean rule
clean:
	rm -f *.o *.x
