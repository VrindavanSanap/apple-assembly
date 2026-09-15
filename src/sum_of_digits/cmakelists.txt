# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.10)

# Define the project and enable the ASM (Assembly) language
project(SUM_N LANGUAGES ASM)

# Add an executable target named 'my_app' from the source file 'main.s'
add_executable(sum_n main.s ../utils/mod_two_values.s)
