#!/usr/bin/env bash

# author Bilikisu Olatunji
# Bash Script to download data from Maven Analytics website


wget https://maven-datasets.s3.amazonaws.com/CRM+Sales+Opportunities/CRM+Sales+Opportunities.zip

wget -O downloads/raw/data.zip https://maven-datasets.s3.amazonaws.com/CRM+Sales+Opportunities/CRM+Sales+Opportunities.zip

wget -O downloads/raw/World_Economic_Indicators.zip https://maven-datasets.s3.amazonaws.com/World+Economic+Indicators/World+Economic+Indicators.zip

unzip -n -d downloads/data/ downloads/raw/data.zip

