context("Test get_closest")
#'
#' This script tests the get_closest function of the distrrr package.
#'
#' The get_closest function returns indices of the top k rows in a dataframe that
#' are closest to a given observation based on a specified distance metric.
#'
#'

# Sample input
x <- c(1,1)
df <- data.frame(x=c(1, 1), y=c(1,2))
k <- 2

test_that("Output should be a vector containing numbers", {
  expect_true(class(get_closest(x, df, k))=="numeric")
})


test_that("Output should have a length of k"){
  if (length(df) >= k){
    expect_equal(length(get_closest(x, df, k)), k)
  }
  else {
    expect_equal(length(get_closest(x, df, k)), length(df))
  }
}

test_that("All numbers in output vector should be non-negative"){
  output <- get_closest(x, df, k)
  expect_true(all(output>=0))
}

test_that("Input data parameter should be a dataframe"){
  expect_error(get_closest(x, 8, k))
}

test_that("Input parameter top_k should be a non-negative integer"){
  expect_error(get_closest(x, df, -2))
}

test_that("Input parameter point should be a vector"){
  expect_error(get_closest(7, df, k))
}
