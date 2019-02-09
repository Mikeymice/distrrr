#'
#' This script tests the get_closest function of the distrrr package.
#'
#' The get_closest function returns indices of the top k rows in a dataframe that
#' are closest to a given observation based on a specified distance metric.
#'

# Sample input
x <- c(1,1)
df <- data.frame(x=c(1, 1), y=c(1,2))
k <- 2

test_that("Output should be a vector containing numerics", {
  expect_true(class(get_closest(x, df, top_k=k))=="numeric",
              "Output is not a vector of numerics")
})
