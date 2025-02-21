# Pyrolysis Viability Analysis
This project was one I built so that I could more effiently access and analyze forest residue samples. There is a simple MySQL database with an API to query data and some 
functions to perform a few automative visualzations and analysis.
## Setup
1. Install [R](https://cran.r-project.org/) and [MySQL](https://dev.mysql.com/downloads/mysql/).
2. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/pyrolysis-analysis.git

mysql -u root < scripts/database/init_db.sql
Rscript requirements.R

---

For VS Code

### **2. Local Machine Setup**  
#### **A. Required Installations**  
1. **MySQL**: [Download Community Server](https://dev.mysql.com/downloads/mysql/)  
2. **R**: [R for Windows/macOS](https://cran.r-project.org/)  
3. **RStudio/VSCode**:  
   - VSCode Extensions: [R](https://marketplace.visualstudio.com/items?itemName=Ikuyadeu.r), [SQLTools](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools)  

#### **B. Optional for Advanced Users**  
- **Docker**: For containerized MySQL (replace local install):  
  ```bash
  docker run --name pyrolysis-mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mysql:8.0

### Example Queries
A. High-Yield Samples (Bio-Oil > 40%)
library(tidyverse)
library(DBI)
library(RMySQL)
con <- dbConnect(MySQL(), dbname = "pyrolysis_db", user = "root")
high_yield <- dbGetQuery(con, "SELECT * FROM samples WHERE biooil_yield_pct > 40")
dbDisconnect(con)
print(high_yield)

B. 
Low Ash Samples (Ash < 3%)
low_ash <- dbGetQuery(con, "SELECT * FROM samples WHERE ash_pct < 3")
print(low_ash)

C. Geographic Heatmap
library(sf)
library(mapview)
samples_sf <- st_as_sf(high_yield, coords = c("longitude", "latitude"), crs = 4326)
mapview(samples_sf, zcol = "biooil_yield_pct", layer.name = "High-Yield Samples")