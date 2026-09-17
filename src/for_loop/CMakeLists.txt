cmake_minimum_required(VERSION 3.15)

project(for_loop
  VERSION 1.0
  DESCRIPTION "A for loop example in assembly"
  LANGUAGES ASM)

# Create the executable from the main source file.
add_executable(${PROJECT_NAME} main.s)

# Add other source files to the target.
# Using target_sources is more flexible than listing all sources in add_executable.
target_sources(${PROJECT_NAME} PRIVATE
    ../utils/read_write_stdin.s
    ../utils/mod_two_values.s
    ../utils/int_to_str/int_to_str.s
    ../utils/reverse_string/reverse_string.s
)

# Set properties for IDEs like Xcode or Visual Studio to organize targets.
set_property(TARGET ${PROJECT_NAME} PROPERTY FOLDER "Executables")
