library(pointblank)
library(tidyverse)

# Validate raw CSV data
validate_raw_data <- function(raw_df) {
  raw_df %>%
    create_agent() %>%
    # Moisture must be between 0-100%
    col_vals_between(vars(moisture_pct), 0, 100) %>%
    # No duplicate sample IDs
    rows_distinct(vars(sample_id)) %>%
    interrogate()
}

# Example usage
raw_data <- read_csv("data/raw/forest_residues.csv")
validation <- validate_raw_data(raw_data)

if (!validation$all_passed) {
  stop("Data validation failed. Check logs for errors.")
}