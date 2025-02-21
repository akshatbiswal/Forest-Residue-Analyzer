library(tidyverse)
library(DBI)
library(RMySQL)

process_raw_data <- function(raw_df) {
  raw_df %>%
    # Dry-basis volatile matter calculation
    mutate(
      vm_dry = volatile_matter_pct / (1 - moisture_pct / 100)
    ) %>%
    # Remove samples with ash >7% (non-viable)
    filter(ash_pct <= 7) %>%
    # Temperature grouping for analysis
    mutate(
      temp_group = case_when(
        pyrolysis_temp_c < 400 ~ "Low",
        pyrolysis_temp_c < 500 ~ "Medium",
        TRUE ~ "High"
      )
    )
}

# Connect to DB and write processed data
con <- dbConnect(MySQL(), dbname = "pyrolysis_db", user = "root")
raw_data <- read_csv("data/raw/forest_residues.csv")
processed_data <- process_raw_data(raw_data)
dbWriteTable(con, "samples", processed_data, overwrite = FALSE, append = TRUE)
dbDisconnect(con)