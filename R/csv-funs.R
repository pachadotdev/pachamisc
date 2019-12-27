# Just to divide messages ----

messageline <- function() {
  message(rep("-", 60))
}

# Read gz compressed CSV files ----

fread2 <- function(file, select = NULL, character = NULL, numeric = NULL) {
  messageline()
  message("function fread2")
  message("file: ", file)

  if (str_sub(file, start = -2) == "gz") {
    d <- fread(
      cmd = paste("zcat", file),
      select = select,
      colClasses = list(
        character = character,
        numeric = numeric
      )
    ) %>%
      as_tibble() %>%
      clean_names()
  } else {
    d <- fread(
      input = file,
      select = select,
      colClasses = list(
        character = character,
        numeric = numeric
      )
    ) %>%
      as_tibble() %>%
      clean_names()
  }

  return(d)
}
