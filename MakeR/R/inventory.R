#' @export
load_inventory <- function(file_path, item_id = "Item_ID") {
  # Load inventory data from a CSV file
  data <- readr::read_csv(file_path)

  # Clean data
  data <- data |>
    tidyr::as_tibble() |>
    tidyr::drop_na() |>
    stringr::str_trim()

  attr(data, "item_id_col") <- item_id

  data
}

#' @export
get_item <- function(inventory_data, item_id) {
  # Get the rows corresponding to the specified item_id
  id_col <- attr(inventory_data, "item_id_col", exact = TRUE)
  item_data <- inventory_data[inventory_data[[id_col]] == item_id, ] |>
    tidyr::as_tibble()
  attr(item_data, "item_id_col") <- id_col

  item_data
}