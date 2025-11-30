#' @export
load_inventory <- function(file_path) {
  # Load inventory data from a CSV file
  data <- read.csv(file_path, stringsAsFactors = FALSE)

  # Clean data
  data <- data |>
    tidyr::drop_na() |>
    stringr::str_trim()
  
  return(data)
}