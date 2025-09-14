# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.10)

# Define the project and enable the ASM (Assembly) language
project(MyAssemblyProject LANGUAGES ASM)

# Add an executable target named 'my_app' from the source file 'main.s'
add_executable(add_two_values add_two_values.s)
add_executable(sub_two_values sub_two_values.s)
add_executable(mul_two_values mul_two_values.s)
add_executable(div_two_values div_two_values.s)

