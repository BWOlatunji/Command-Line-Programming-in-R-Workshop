#!/usr/bin/env bash

# author Bilikisu Olatunji
# Bash Script to download data from Maven Analytics website

# variables that come in from the command line and assign it to a named
# variable within our script

# url of the zipped data file
data_url=$1

# path and new name for downloaded zipped file
# new_name=$2

new_path=$2

# path to the zipped data 
file_to_unzip=$3

# path to the directory where the zipped files will be kept
# unzipped_files_path=$4

# Always use double quote to get the value instead of the variable name
# echo "$url"
# .wget "$data_url"

# Saving the Downloaded File Under Different Name
# wget -O crm_sales_data.zip https://maven-datasets.s3.amazonaws.com/CRM+Sales+Opportunities/CRM+Sales+Opportunities.zip
# wget -O "$new_name" "$data_url" 


# Downloading a File to a Specific Directory
wget -P "$new_path" "$data_url"

# unzip files
# unzip this file to the current directory
unzip "$file_to_unzip"

# overwrite existing unzipped files without being prompted by using the -o option
# unzip -o "$file_to_unzip"

# unzip a zipped file to a specified directory by using the -d option
# unzip "$new_path" -d "$unzipped_files_path"



