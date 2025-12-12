#' @export
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