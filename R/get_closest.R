#' get_closest
#'
#' Returns the indices of the top k rows in a dataframe that are closest to
#' a given obversation (point) based on a specificed distance metric.
#'
#' @param point Vector, values defining a single observation to compute distances for
#' @param data Dataframe, values of all observations to calculate distances from point
#' @param top_k Integer, number of closest observations to return indices for
#' @param dist Char, type of distance metric to use in distance calculations
#'
#' @return Vector, indices of the closest k observations from data

#' @export
#'
#' @examples
#' df <- data.frame(x=c(1, 1), y=c(1,2))
#' get_closest(c(1,1), df, 2)
#'
get_closest <- function(point, data, top_k, metric="euclidean") {

  # Check that inputs are valid and as expected
  if(!is.vector(point, mode="numeric")) stop("Input point should be a vector of numerics")

  if(class(data) != "data.frame") stop("Input data should be a dataframe")

  if(class(top_k) != "numeric") stop("Input top_k should be a number")

  if(top_k<0) stop("Input top_k should be non-negative")

  if(class(metric) != "character") stop("Input metric should be a character")

  distance_metrics <- c("cosine", "euclidean", "manhattan")
  if(!metric %in% distance_metrics) stop("Input metric should be a supported distance metric,
                                         one of: 'cosine', 'euclidean', or 'manhattan'")

  if (top_k > length(data)) message("Note that since top_k is larger than the number of points in the dataframe, fewer than top_k indices will be returned.")

  # Call helper function to compute distances
  distances <- get_all_distances(point, data, metric)

  # Sort distances in ascending order (smallest distances first)
  # and return indices in that order
  dist_index_sorted <- order(distances)

  # Vector or indices to fill and return
  indices <- numeric()

  if (length(distances) >= top_k) {
    indices <- dist_index_sorted[1:top_k] # Returns first top_k indices
  } else {
    indices <- dist_index_sorted # Returns all indices ordered by closest distance
  }
  return(as.numeric(indices))
}
