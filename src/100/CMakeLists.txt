add_executable(ten ten.s)
add_executable(digit digit.s)
target_link_libraries(ten utils)
target_link_libraries(digit utils)