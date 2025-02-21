library(plumber)
library(DBI)
library(RMySQL)

#* @apiTitle Pyrolysis Data API
#* @apiDescription Access forest residue pyrolysis data

#* Get samples by batch
#* @param batch_id:int Batch ID to filter
#* @get /samples
function(batch_id = NULL) {
  con <- dbConnect(MySQL(), dbname = "pyrolysis_db", user = "root")
  query <- "SELECT * FROM samples"
  if (!is.null(batch_id)) {
    query <- paste0(query, " WHERE batch_id = ", batch_id)
  }
  data <- dbGetQuery(con, query)
  dbDisconnect(con)
  return(data)
}

#* Start API
pr <- plumb("api/endpoints.R")
pr$run(port = 8000)