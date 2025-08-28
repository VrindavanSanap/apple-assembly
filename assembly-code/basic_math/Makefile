# Compiler and flags
AS = as
LD = ld
# macOS SDK paths
SDKROOT = /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.5.sdk

CFLAGS = -I$(SDKROOT)/usr/include
LDFLAGS = -L$(SDKROOT)/usr/lib

# Source files
ASM_SOURCES = $(wildcard *.s)
OBJECTS = $(ASM_SOURCES:.s=.o)
EXECUTABLES = $(ASM_SOURCES:.s=.x)

# Default target
all: $(EXECUTABLES)

# Pattern rule for object files
%.o: %.s
	$(AS) $< -o $@

# Pattern rule for executables
%.x: %.o
	$(LD) $(LDFLAGS) -lSystem $< -o $@

# Clean target
clean:
	rm -f $(OBJECTS) $(EXECUTABLES)

.PHONY: all clean
