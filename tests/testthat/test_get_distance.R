#' test_get_distance.R
#' Feb 2019
#' @author: Mike Yuan
#'
#' This script is for testing the funcitonaly and validate input for get_distance.R
context("Test get_distance")
# dummy input
x1 <- c(1,1, 1)
x2 <- c(2,3, 4)
x3 <- c(1,1)
x4 <- c()
x5 <- c(1, 3, 4, 5)
x6 <- 123

# helper cheker function

# cosine
cd <- function(a,b){
  dp <- sum(a*b)
  amag <- sqrt(sum(a^2))
  bmag <- sqrt(sum(b^2))

  dp/(amag*bmag)
}

# euclidean
euc <- function(a,b){
  sqrt(sum((a-b)^2))
}

#manhhantan
man <- function(a,b){
  sum(abs(a-b))
}

test_that("Output distance should be Euclidean", {
  expect_equal(get_distance(x1, x2), euc(x1,x2))
  expect_equal(get_distance(x2, x1), euc(x1,x2))
})

test_that("Output distance should be cosine", {
  expect_equal(get_distance(x1, x2, metric = "cosine"), cd(x1,x2))
  expect_equal(get_distance(x2, x1, metric ="cosine"), cd(x1,x2))
})

test_that("Output distance should be manhattan", {
  expect_equal(get_distance(x1, x2, metric = "manhattan"), man(x1,x2))
  expect_equal(get_distance(x2, x1, metric ="manhattan"), man(x1,x2))
})


# test for unequal input length
test_that("Input should have the same length", {
  expect_error(get_distance(x1, x3), "Inputs have different length")
  expect_error(get_distance(x3, x1), "Inputs have different length")
  expect_error(get_distance(x5, x3), "Inputs have different length")
  expect_error(get_distance(x1, x5), "Inputs have different length")

})

# test for empty list
test_that("Test for empty vector and NULL", {
  expect_error(get_distance(x1, c()), "Input cannot be neigher empty vector nor NULL")
  expect_error(get_distance(c(), x1), "Input cannot be neigher empty vector nor NULL")

})

# test for non-numeric list
test_that("Test for non-numeric", {
  expect_error(get_distance(x1, "123"), "Input has to be vector containing numeric elements")
  expect_error(get_distance("abc", x1), "Input has to be vector containing numeric elements")

})



