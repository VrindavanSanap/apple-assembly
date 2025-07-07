#include <stdio.h>

int euclid_gcd(int a, int b){
  // This algorithm gives us the gcd of a, b

  if (a < b){
    return euclid_gcd(b, a);
  }

  int remainder = a % b;
  if (remainder == 0) {
    return b;
  }
  return euclid_gcd(b, remainder);
}

int main(){
  // The Greatest Common Divisor of two numbers is 
  // the largest number that divides both without 
  // leaving a remainder.
  
  int a = 24;
  int b = 18;

  int ans = euclid_gcd(a, b);

  printf("GCD = %d \n" , ans);
  return 0;
}


