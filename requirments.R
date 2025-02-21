if (!requireNamespace("pacman", quietly = TRUE)) {
  install.packages("pacman")
}

pacman::p_load(
  tidyverse,   # Data manipulation
  DBI,         # Database interface
  RMySQL,      # MySQL driver
  plumber,     # API framework
  ggplot2,     # Visualizations
  pointblank   # Data validation
)