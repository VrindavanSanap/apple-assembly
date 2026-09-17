cmake_minimum_required(VERSION 3.15)

project(int_to_str VERSION 1.0
  DESCRIPTION "Converts int datatype to string"
  LANGUAGES ASM)

add_executable(main main.s int_to_str.s ../read_write_stdin.s  ../mod_two_values.s ../reverse_string/reverse_string.s)




