#include <stdio.h>

void fib(int n){
  // prints first n fibonacci numbers
  
  if (n < 0){
    return;
  }

  int prev_prev_fib = 0;
  int prev_fib = 1;
  int temp = 0;

  for(int i = 0; i< n;i++){
    printf("%d \n", prev_prev_fib);
    temp = prev_fib;
    prev_fib = prev_fib + prev_prev_fib;
    prev_prev_fib = temp;


  }
}


int main(){

  fib(10);

}
