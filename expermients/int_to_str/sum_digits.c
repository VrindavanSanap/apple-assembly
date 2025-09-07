#include <stdio.h>
int sum_digits(int n){
  int res =0;
  while(n!=0){
    res += n%10;
    n = n /10;
  }
  return res;
}
int main(){
  int n = 12345;
  int res = sum_digits(n);
  printf("%d", res);
  
  

}
