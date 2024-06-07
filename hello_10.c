#include <unistd.h> // For syscall constants and write function

int main() {
  char *message = "Hello, world!\n";
  size_t length = 14; 
  for (int i = 0; i < 10; i++){

    write(1, message, length);

  }


  return 0;
}
