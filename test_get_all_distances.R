library(testthat)

test_that("Output vector is the same length of the number of rows of input data frame"){

      df <- data.frame("A" = c(1,2,3), "B" = c(2,4,6))
      ref_vec <- c(-2,4)

      dists <- get_all_distances(df, ref_vec)

      expect_equal(dim(df)[1], length(dists))
}

test_that("Distance metrics are correct for euclidean distance"){

      df <- data.frame("A" = c(1,2,3), "B" = c(2,4,6))
      ref_vec <- c(-2,4)

      dists <- get_all_distances(df, ref_vec)

      expect_equal(dim(df)[1], length(dists))
}
