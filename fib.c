#include <stdio.h>
int fib(int n){
  /*
    return the nth fibonacci number
  */

  int x, y, z;

  x = 0;
  y = 1;
  
  for (int i = 0; i< n ; i++){
      z = x + y;
      x = y;
      y = z;
  }
 
  return z;


}
int main(void){
  int a = fib(10);
  printf("%d", a);
  return 0;
}

