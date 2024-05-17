#!/usr/bin/env bash

# author Bilikisu Olatunji
# Bash Script to download data from Maven Analytics website

# variables that come in from the command line and assign it to a named
# variable within our script

# url of the zipped data file
data_url=$1

# path and new name for downloaded zipped file
new_name=$2

# path to the unzipped data 
unzipped_files_path=$3


# Always use double quote to get the value instead of the variable name

# Saving the Downloaded File Under Different Name
wget -O "$new_name" "$data_url" 


# unzip a zipped file to a specified directory by using the -d option
unzip -n -d "$unzipped_files_path" "$new_name"



