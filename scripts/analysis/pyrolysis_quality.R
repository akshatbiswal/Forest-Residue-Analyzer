library(tidyverse)
library(DBI)
library(RMySQL)
library(ggplot2)

# Connect to MySQL
con <- dbConnect(MySQL(), dbname = "pyrolysis_db", user = "root")

# Load data from DB
raw_data <- tbl(con, "samples") %>% collect()

# Classify sample quality
analysis_data <- raw_data %>%
  mutate(
    quality = case_when(
      biooil_yield_pct >= 40 & ash_pct <= 5 ~ "Excellent",
      biooil_yield_pct >= 30 & ash_pct <= 7 ~ "Good",
      TRUE ~ "Poor"
    )
  )

# Save results to CSV
write_csv(analysis_data, "outputs/results/quality_ratings.csv")

# Generate visualization
ggplot(analysis_data, aes(x = lignin_pct, y = biooil_yield_pct, color = quality)) +
  geom_point(size = 3) +
  labs(title = "Pyrolysis Viability by Lignin Content")
ggsave("outputs/visualizations/lignin_vs_yield.png")

dbDisconnect(con)