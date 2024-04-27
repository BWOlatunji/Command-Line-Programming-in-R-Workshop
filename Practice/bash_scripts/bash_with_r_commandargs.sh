#!/usr/bin/env bash

# author Bilikisu Olatunji
# Bash Script to download data from Maven Analytics website

args <- commandArgs(trailingOnly = TRUE)

# Always use double quote to get the value instead of the variable name
echo args[1]

# wget args[1]
# 
# unzip -n -d args[2] CRM+Sales+Opportunities.zip