
# Add an executable target named 'my_app' from the source file 'main.s'
add_executable(hello hello.s)
add_executable(hellloo hellloo.s)
add_executable(hello_5 hello_5.s)
target_link_libraries(hello_5 utils)

