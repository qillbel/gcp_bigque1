# Use the official R base image
FROM rocker/r-ver:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev

# Install required R packages
RUN R -e "install.packages(c('bigrquery', 'googleCloudStorageR'))"

# Copy the R script into the container
COPY bigquery_script.R /app/bigquery_script.R

# Set working directory
WORKDIR /app

# Set default command to run the script
CMD ["Rscript", "bigquery_script.R"]