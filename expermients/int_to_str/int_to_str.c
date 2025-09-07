#include <stdio.h>
char int_to_char(int a){
  return a + '0';
}

char int_to_str(int n, char *buffer){
  int i = 0;
  while (n != 0){
    buffer[i++] = int_to_char(n%10);
    n = n / 10;
  }
}

char reverse_str(char* buffer, int size){
  size -=1; 
  int i = 0;
  while(1){
    char temp = buffer[i];
    buffer[i] = buffer[size];
    buffer[size] = temp;
    i++;
    size--;
    if(i >= size){
      break;
    }
  }
}

int main(){

  int n = 12345;
  char buffer[6];
  buffer[5] = '\0';
  int_to_str(n, buffer);
  reverse_str(buffer, 5);
  printf("%s", buffer);
}

