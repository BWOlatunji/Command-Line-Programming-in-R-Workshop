#!/usr/bin/env bash

# author Bilikisu Olatunji
# Bash Script to download data from Maven Analytics website

# variables that come in from the command line and assign it to a named
# variable within our script
url=$1
data_file=$2
file_to_unzip=$3

# Always use double quote to get the value instead of the variable name
# echo "$url"

wget "$url"

unzip -n -d "$data_file" "$file_to_unzip"



