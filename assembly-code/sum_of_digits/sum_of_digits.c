#include <stdio.h>


int sum_of_digits(int n){

  int s = 0;
  while(n > 10){
    s += n%10;
    n = n/10;
  }

  s += n;
  return s;

}
int main(){

  int n = 12345;
  int res = sum_of_digits(n);
  printf("%d", res);
  
  return 0;
}
