#!/bin/bash  # Add shebang line

if [ $# -eq 0 ]; then
  # Use $0 for script name
  echo "Usage: $0 <file_name>" 
    exit 1
fi


# Assign the first argument to variable
ass_file_name="$1" 
if [[ ! "$ass_file_name" =~ \.s$ ]]; then
  echo "Error: File must end with '.s' extension."
  exit 1
fi


obj_file_name="${ass_file_name%.*}.o"
exec_file_name="${ass_file_name%.*}.x"
# Use $output_file_name for output
as "$1" -o "$obj_file_name"  

ld -o "$exec_file_name" "$obj_file_name" \
  -lSystem -syslibroot "$(xcrun -sdk macosx --show-sdk-path)"

