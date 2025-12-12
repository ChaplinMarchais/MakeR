#' @export
find_avg_stage_time <- function(item_data, stage_time_postfix = "_Hours") {
    item_col <- attr(item_data, "item_id_col", exact = TRUE)

    result <- item_data |>
      dplyr::select(item_col, dplyr::ends_with(stage_time_postfix)) |>
      dplyr::summarise(dplyr::across(
        dplyr::ends_with(stage_time_postfix),
        ~ mean(.x, na.rm = TRUE)
    ),
    .by = item_col)

    result
}