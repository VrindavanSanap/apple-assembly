# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.10)

# Define the project and enable the ASM (Assembly) language
project(MyAssemblyProject LANGUAGES ASM)

# Add an executable target named 'my_app' from the source file 'main.s'
add_executable(hello hello.s)
add_executable(hellloo hellloo.s)
add_executable(hello_n hello_n.s)
add_executable(hello_5 hello_5.s)

