#' test_get_all_distances.R
#' Feb 2019
#' @author: Evan Yathon
#'
#' This script is for testing the functionality for get_all_distances.R

library(testthat)

test_that("Output vector is the same length of the number of rows of input data frame",{

      df <- data.frame("A" = c(1,2,3), "B" = c(8,2,4))
      ref_vec <- c(-2,4)

      dists <- get_all_distances(ref_vec, df)

      expect_equal(dim(df)[1], length(dists))
})

test_that("Output vector is type numeric",{

      df <- data.frame("A" = c(1,2,3), "B" = c(8,2,4))
      ref_vec <- c(-2,4)

      dists <- get_all_distances(ref_vec, df)

      expect_that(dists, is_a("numeric"))
})

test_that("Distance metrics are correct different metrics distance",{

      df <- data.frame("A" = c(1,2,3), "B" = c(8,2,4))
      ref_vec <- c(-2,4)

      dists <- get_all_distances(ref_vec, df, metric = "euclidean")
      expect_equal(round(dists,2), c(5,4.47,5))

      dists <- get_all_distances(ref_vec, df, metric = "cosine")
      expect_equal(round(dists,2), c(0.83,0.32,0.45))

      dists <- get_all_distances(ref_vec, df, metric = "manhattan")
      expect_equal(round(dists,2), c(7,6,5))
})

test_that("Second argument data should be a data frame",{
      ref_vec <- c(-2,4)

      expect_error(get_all_distances(ref_vec,c(1,2,3)), info = "Second Argument data not a dataframe")
      expect_error(get_all_distances(ref_vec,2), info = "Second Argument data not a dataframe")
      expect_error(get_all_distances(ref_vec,list("A" = c(1,2,3), "B" = c(8,2,4))), info = "Second Argument data not a dataframe")
})

test_that("First argument point should be a numeric vector",{
      df <- data.frame("A" = c(1,2,3), "B" = c(8,2,4))

      expect_error(get_all_distances("a",df), info = "first argument point should be a numeric vector")
      expect_error(get_all_distances(df,df), info = "first argument point should be a numeric vector")
})


test_that("Point should be length k, the number of columns of the input dataframe",{
      df <- data.frame("A" = c(1,2,3), "B" = c(8,2,4))
      ref_vec <- c(1,2,3,4)

      expect_error(get_all_distances(ref_vec,df), "Point should be length k, the number of columns of the input dataframe")
})

test_that("dist_type should be a string and one of 'cosine', 'euclidean' or 'manhattan'",{
      df <- data.frame("A" = c(1,2,3), "B" = c(8,2,4))
      ref_vec <- c(1,2)

      expect_error(get_all_distances(ref_vec,df, metric = 1), "dist_type should be a string and one of 'cosine', 'euclidean' or 'manhattan'")
      expect_error(get_all_distances(ref_vec,df, metric = "cityblock"), "dist_type should be a string and one of 'cosine', 'euclidean' or 'manhattan'")
})


