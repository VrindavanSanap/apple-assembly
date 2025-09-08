#include<stdio.h>
int main(){
  char* fizz = "fizz";
  char* buzz = "buzz";
  char* fizz_buzz = "fizzbuzz";
  for (int i = 1; i< 21; i++){

    // if divisible by both print fizzbuzz
    if (((i%3)==0)&((i%5)==0)){
      printf("%s \n", fizz_buzz);
    }


    // if divisible by 3 print fizz
    else if ((i%3)==0){
      printf("%s \n", fizz);
    }

    // if divisible by 5 print buzz
    else if ((i%5)==0){
      printf("%s \n", buzz);
    }

    else{
      printf("%d \n", i);
    }
     
  }

  return 0;
}
