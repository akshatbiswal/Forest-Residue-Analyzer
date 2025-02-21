library(tidyverse)
library(DBI)
library(RMySQL)

con <- dbConnect(MySQL(), dbname = "pyrolysis_db", user = "root")

# Compare two batches
batch1 <- tbl(con, "samples") %>% filter(batch_id == 1) %>% collect()
batch2 <- tbl(con, "samples") %>% filter(batch_id == 2) %>% collect()

# Generate comparison plot
combined_data <- bind_rows(
  batch1 %>% mutate(batch = "Batch 1"),
  batch2 %>% mutate(batch = "Batch 2")
)

ggplot(combined_data, aes(x = batch, y = biooil_yield_pct, fill = batch)) +
  geom_boxplot() +
  labs(title = "Biooil Yield Comparison by Batch")
ggsave("outputs/visualizations/batch_comparison.png")

dbDisconnect(con)