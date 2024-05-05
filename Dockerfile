# Base R Shiny image
FROM ubuntu

# Make a directory in the container
RUN mkdir /tmp/Practice

# Copy the Shiny app code
COPY ./Practice ./tmp/Practice


