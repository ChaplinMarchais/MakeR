#' @export
#' @title Find Average Stage Time for an Item
#' @name find_avg_stage_time
#' @description Calculate the average time spent in each production stage
#' for a specific item.
#'
#' @param item_data A tibble containing data for a specific item.
#' @param stage_time_postfix A character string indicating the postfix
#' used to identify stage time columns.
#'   Default is "_Hours".
#' @return A tibble with the average time spent in each production stage
#' for the specified item.
#' @examples
#' find_avg_stage_time(sample) # Calculate average stage times for all items in the sample dataset
find_avg_stage_time <- function(item_data, stage_time_postfix = "_Hours") {
    item_col <- attr(item_data, "item_id_col", exact = TRUE)

    result <- item_data |>
      dplyr::select(item_col, dplyr::ends_with(stage_time_postfix)) |>
      dplyr::summarise(dplyr::across(
        dplyr::ends_with(stage_time_postfix),
        ~ mean(.x, na.rm = TRUE)
      ), .by = item_col) |>
      dplyr::ungroup()

    result
}

#' @export
find_stage_quantities <- function(item_data, stage_col = "Current_Stage", qty_col = "Quantity") {
    item_col <- attr(item_data, "item_id_col", exact = TRUE)

    result <- item_data |>
      dplyr::select(item_col, stage_col, qty_col) |>
      dplyr::group_by(Item_ID = item_data[[item_col]],
                      Stage = item_data[[stage_col]]) |>
      dplyr::summarise(dplyr::across(qty_col,
                                     ~ sum(.x, na.rm = TRUE))) |>
      dplyr::ungroup()

    result
}

#' @export
find_total_production_time <- function(item_data, stage_time_postfix = "_Hours") {
    item_col <- attr(item_data, "item_id_col", exact = TRUE)

    result <- item_data |>
      dplyr::select(item_col, dplyr::ends_with(stage_time_postfix)) |>
      dplyr::mutate(Total_Time = rowSums(dplyr::across(
        dplyr::ends_with(stage_time_postfix)
      ))) |>
      dplyr::select(!dplyr::ends_with(stage_time_postfix))

    result
}
