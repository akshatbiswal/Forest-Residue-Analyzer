# Set a CRAN mirror for faster downloads
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Install pacman if missing
if (!requireNamespace("pacman", quietly = TRUE)) {
  install.packages("pacman", Ncpus = 4)  # Use parallel compilation
}

# Install packages with binary versions (avoids compilation)
pacman::p_load(
  tidyverse,
  DBI,
  RMySQL,
  plumber,
  ggplot2,
  pointblank,
  install = TRUE,
  Ncpus = 4  # Speed up via parallel installs
)