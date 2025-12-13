test_that("find_avg_stage_time works", {
  avg_times <- find_avg_stage_time(MakeR::sample)

  expect_equal(nrow(avg_times), 25) # Check number of items

  expect_true(all(colnames(avg_times) %in% 
    c("Item_ID", "Stage1_Hours", "Stage2_Hours", "Stage3_Hours")
  )) # Check column names

  expect_equal(avg_times[1, ], tibble::tibble(
    Item_ID = "BATCH001",
    Stage1_Hours = 1.75,
    Stage2_Hours = 2.75,
    Stage3_Hours = 0.75
  )) # Check specific averages for BATCH001
})

test_that("find_stage_quantities works", {
  stage_qtys <- find_stage_quantities(MakeR::sample)

  expect_true(all(colnames(stage_qtys) %in%
                  c("Item_ID", "Stage", "Quantity"))) # Check column names

  expect_equal(nrow(stage_qtys), 26) # Check number of rows

  batch1_qty_for_both_stages <- stage_qtys |>
    dplyr::filter(Item_ID == "BATCH001") |>
    dplyr::pull(Quantity)

  expect_equal(batch1_qty_for_both_stages, c(85,50)) # Check that there are two stages for BATCH001 with correct quantities
})

test_that("find_total_production_time works", {
  total_times <- find_total_production_time(MakeR::sample)

  expect_true(all(colnames(total_times) %in%
    c("Item_ID", "Total_Time")
  )) # Check column names

  expect_equal(nrow(total_times), 27) # Check number of rows

  expect_equal((total_times |> dplyr::pull(Total_Time))[1:5],
    c(8, 8, 3.5, 5.5, 0.75)) # Check total times for first five items
})