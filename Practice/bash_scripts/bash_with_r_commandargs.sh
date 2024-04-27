#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

# author Bilikisu Olatunji
# Bash Script to download data from Maven Analytics website

#cat(args, sep = "\n")

wget args[1]

unzip -n -d args[2] CRM+Sales+Opportunities.zip