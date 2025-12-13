test_that("find_avg_stage_time works", {
  avg_times <- find_avg_stage_time(MakeR::sample)
  expect_equal(nrow(avg_times), 25) # Check number of items
  expect_true(all(colnames(avg_times) %in%
                       c("Item_ID", "Stage1_Hours", "Stage2_Hours", "Stage3_Hours")))
  testthat::expect_equal(avg_times[1, ], tibble::tibble(
    Item_ID = "BATCH001",
    Stage1_Hours = 1.75,
    Stage2_Hours = 2.75,
    Stage3_Hours = 0.75
  ))
})
