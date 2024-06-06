#include <unistd.h> // For syscall constants and write function

int main() {
  char *message = "Hello, world!\n";
  size_t length = 14; // Length of the message, including null terminator

  // Using the write syscall to write the message to standard output (stdout)
  // syscall number for write is 1 on most systems
  // File descriptor for stdout is 1
  // Message is the buffer containing the string
  // Length is the length of the string
  write(1, message, length);


  return 0;
}
