# Pyrolysis Viability Analysis

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