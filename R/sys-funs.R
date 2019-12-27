# Extract zip compressed csv files ----
# This needs 7-zip. Run sudo apt install p7zip-full beforehand.

extract <- function(x, y, t) {
  if (file.exists(str_replace(x[t], "zip", "csv"))) {
    messageline()
    message(paste(x[t], "already unzipped. Skipping."))
  } else {
    messageline()
    message(paste("Unzipping", x[t]))
    system(sprintf("7z e -aos %s -oc:%s", x[t], y))
  }
}

# Try to remove ----
# just to avoid errors if files don't exist

file_remove <- function(x) {
  try(file.remove(x))
}

# Compress in gz format ----

compress_gz <- function(x) {
  system(paste("gzip", x))
}

# Remove outdated files ----

remove_outdated <- function(x) {
  try(
    file.remove(
      grep(
        paste(paste0(files_to_remove$year, ".csv.gz"), collapse = "|"),
        x,
        value = T
      )
    )
  )
}

remove_outdated_2 <- function(x,t) {
  try(
    file.remove(
      grep(
        paste(paste0(t, ".csv.gz"), collapse = "|"),
        x,
        value = T
      )
    )
  )
}
