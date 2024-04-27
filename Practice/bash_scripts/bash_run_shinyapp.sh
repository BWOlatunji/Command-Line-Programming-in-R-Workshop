#!/usr/bin/env bash

# Run the R script using Rscript
Rscript -e 'shiny::runApp("shiny_app/", launch.browser = TRUE)'