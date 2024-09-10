#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <contents_file> <specifier> <output_file>"
  exit 1
fi

# Assign arguments to variables
contents_file=$1
specifier=$2
output_file=$3

# Construct header and footer filenames
header_file="${specifier}_header.html"
footer_file="${specifier}_footer.html"

# If the contents file does not exist, print an error message and exit
if [ ! -f "$contents_file" ]; then
  echo "Contents file '$contents_file' not found!"
  exit 1
fi

# If the header file does not exist, print an error message and exit
if [ ! -f "$header_file" ]; then
  echo "Header file '$header_file' not found!"
  exit 1
fi

# If the footer file does not exist, print an error message and exit
if [ ! -f "$footer_file" ]; then
  echo "Footer file '$footer_file' not found!"
  exit 1
fi

# Combine the files into the output file
cat "$header_file" "$contents_file" "$footer_file" > "$output_file"