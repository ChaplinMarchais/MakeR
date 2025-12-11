#' @export
load_inventory <- function(file_path) {
  # Load inventory data from a CSV file
  data <- readr::read_csv(file_path)

  # Clean data
  data <- data |>
    tidyr::as_tibble() |>
    tidyr::drop_na() |>
    stringr::str_trim()

  data
}

#' @export
get_item <- function(inventory_data, item_id) {
  # Get the rows corresponding to the specified item_id
  item_data <- inventory_data[inventory_data$Item_ID == item_id, ] |>
    tidyr::as_tibble()
  item_data
}