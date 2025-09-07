#include <stdio.h>

int euclid(int dividend, int divisor){

  int quotient = dividend / divisor;
  int remainder = dividend % divisor;
  if (remainder == 0){
    return divisor;
  }else{
    return euclid(divisor, remainder);
  }

}

int main(){
  int a = 1071;
  int b = 462;
  int c = euclid(a, b);
  printf("%d", c);

}

