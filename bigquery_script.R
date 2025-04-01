library(bigrquery)

# Authenticate using the service account key
bq_auth(path = "/app/dashgcp-452719-b205be8747a1.json")

# Set project ID
project_id <- "dashgcp-452719"

# Define the SQL query
query <- "SELECT * FROM `dashgcp-452719.qb_ordsur_1_dset.tab_OpenNames` LIMIT 10"

# Execute the query
result <- bq_project_query(project_id, query)

# Convert to dataframe
df <- bq_table_download(result)

# Print the results
print("show dataframe...")
print(df)
