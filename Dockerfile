# Base R Shiny image
FROM rocker/rstudio

# Make a directory in the container
RUN mkdir /home/Practice


# # Copy the Shiny app code
COPY ./Practice ./home/Practice

