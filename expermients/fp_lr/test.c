void some_func2(){
  int a = 10;
}
void some_func(){
  int a = 10;
  some_func2();
}
int main(){

  some_func();
}
