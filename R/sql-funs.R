# PostgreSQL database connection
# If the credentials are not located in .Rprofile, this won't work.
# Don't edit to put credentials here!

psql_con <- function() {
  DBI::dbConnect(
    DBI::dbDriver("PostgreSQL"),
    host = dbhost,
    port = dbport,
    user = dbusr,
    password = dbpwd,
    dbname = dbname
  )
}
