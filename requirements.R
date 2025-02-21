# Use RStudio Package Manager for binaries
options(repos = c(RSPM = "https://packagemanager.posit.co/all/__linux__/jammy/latest"))

# Minimal required packages
essential_packages <- c(
  "tidyverse/ggplot2",     # Core visualization
  "tidyverse/dplyr",       # Data manipulation
  "r-dbi/DBI",             # Database interface
  "r-dbi/RMySQL",          # MySQL connector
  "tidyverse/readr",       # CSV I/O
  "rstudio/plumber"        # API framework
)

# Install using binary-first approach
install.packages(
  c("remotes", "pak"),  # Modern package manager
  Ncpus = 4,
  dependencies = c("Depends", "Imports")
)

remotes::install_github(
  essential_packages,
  dependencies = FALSE,  # Avoid recursive installs
  upgrade = "never",
  Ncpus = 4
)