the <- new.env(parent = emptyenv())

#' Sample Inventory Dataset
#'
#' A dataset containing sample inventory data for testing purposes.
#'
#' @format A data frame with 25 rows and 15 variables:
#' \describe{
#'   \item{Item_ID}{Character. Unique identifier for each production batch.
#'     Format: "BATCH" followed by 3-digit number (e.g., "BATCH001").}
#'   \item{Item_Name}{Character. Descriptive name of the product or component
#'     being manufactured (e.g., "Motor Assembly A", "Control Panel X").}
#'   \item{Category}{Character. Product classification. Currently all items
#'     are classified as "Product".}
#'   \item{Current_Stage}{Character. Current location in the production process.
#'     One of: "Stage 1 - Cutting", "Stage 2 - Assembly", "Stage 3 - Finishing",
#'     or "Finished".}
#'   \item{Quantity}{Integer. Number of units in the batch. Range: 28-250 units.}
#'   \item{Unit}{Character. Unit of measurement, always "units".}
#'   \item{Unit_Cost}{Numeric. Cost per single unit in USD. Range: $12.00-$280.00.}
#'   \item{Total_Value}{Numeric. Total batch value in USD, calculated as
#'     Quantity × Unit_Cost. Range: $2,700-$18,750.}
#'   \item{Location}{Character. Physical location within the facility. One of:
#'     "Production Floor 1" (Stage 1), "Production Floor 3" (Stage 2),
#'     "Finishing Area" (Stage 3), or "Finished Goods Warehouse" (completed items).}
#'   \item{Stage1_Hours}{Numeric. Time spent in Stage 1 (Cutting/Initial Processing)
#'     in hours. Range: 0.0-2.5 hours. Zero if item hasn't reached this stage.}
#'   \item{Stage2_Hours}{Numeric. Time spent in Stage 2 (Assembly) in hours.
#'     Range: 0.0-5.0 hours. Zero if item hasn't reached this stage.}
#'   \item{Stage3_Hours}{Numeric. Time spent in Stage 3 (Finishing) in hours.
#'     Range: 0.0-1.5 hours. Zero if item hasn't reached this stage.}
#'   \item{Total_Production_Time}{Numeric. Cumulative production time across all
#'     stages in hours. Calculated as Stage1_Hours + Stage2_Hours + Stage3_Hours.
#'     Range: 0.25-8.0 hours.}
#'   \item{Last_Updated}{Character. Date of last record update in ISO 8601 format
#'     (YYYY-MM-DD). Dates range from 2024-12-07 to 2024-12-10.}
#'   \item{Status}{Character. Production status. Either "In Progress" (currently
#'     being processed) or "Complete" (finished all stages).}
#' }
#' @source Generateed using Claude 3.5
"sample"