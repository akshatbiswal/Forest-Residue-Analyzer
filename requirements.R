# Use a fast CRAN mirror
options(repos = c(CRAN = "https://cran.rstudio.com"))

# Install critical packages one by one with error handling
packages <- c(
  "tidyverse",  # dplyr, ggplot2, etc.
  "DBI",
  "RMySQL",
  "plumber",
  "pointblank"
)

for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg, Ncpus = 2, quiet = TRUE)
  }
}