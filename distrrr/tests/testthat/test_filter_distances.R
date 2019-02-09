#'
#' This script tests the filter_distances function of the distrrr package.
#'
#' The filter_distances function returns indices of rows in a dataframe
#' that are within a given threshold distance from a given observation
#' based on a specified distance metric.
#'

# Sample input
x <- c(1,1)
df <- data.frame(x=c(1, 1), y=c(1,2))
threshold = 0.9

test_that("Output should be a vector containing numerics", {
  expect_true(class(filter_distances(x, df, threshold=threshold))=="numeric",
              "Output is not a vector of numerics")
})
