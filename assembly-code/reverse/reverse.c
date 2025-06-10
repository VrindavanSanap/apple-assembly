void reverse_str(char input_str[], int len) {
  int last_index = len - 2;
  for (int i = 0; i < len/2; i++) {
    char temp = input_str[i];
    input_str[i] = input_str[last_index];
    input_str[last_index--] = temp;
  }
}

int main() {
  char hello[] = "abcde";
  reverse_str(hello, 6);
  return 0;
}

