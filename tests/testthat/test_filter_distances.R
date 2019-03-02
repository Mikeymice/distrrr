context("Test filter_distances")
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

test_that("Output should be a vector containing numbers", {
  expect_true(class(filter_distances(x, df, threshold))=="numeric")
})

test_that("All numbers in output vector should be non-negative",{
  output <- filter_distances(x, df, threshold)
  expect_true(all(output>=0))
})

test_that("Input data parameter should be a dataframe",{
  expect_error(filter_distances(x, 8, threshold))
})

test_that("Input parameter threshold should be a non-negative integer",{
  expect_error(filter_distances(x, df, -5.5))
})

test_that("Input parameter point should be a vector",{
  expect_error(filter_distances(10, df, threshold))
})
