#' filter_distances
#'
#' @param point Vector, values defining a single observation to compute distances for
#' @param data Dataframe, values of all observations to calculate distances from point
#' @param threshold float, maximum distance of observations to return indices for
#' @param metric Char, type of distance metric to use in distance calculations
#'
#' @return Vector, indices of the observations with distance less than `threshold` from `point`

#' @export
#'
#' @examples
#' df <- data.frame(x=c(1, 1), y=c(1,2))
#' filter_distances(c(1,1), df, 0.9)
#'
filter_distances <- function(point, data, threshold, metric="euclidean") {

  # raise error if threshold is not a single value
  if(length(threshold) != 1) stop("threshold must be a single value")

  # raise error if threshold isn't class numeric
  if(class(threshold) != "numeric") stop("threshold must be a numeric value")

  # raise error if threshold is negative
  if(threshold < 0) stop("threshold must be non-negative")

  # input validation above
  # ------------------------
  # main function code below

  distances <- get_all_distances(point, data, metric)
  indices = vector('integer')

  for(i in 1:length(distances)){
    if(distances[i] <= threshold){
      indices <- c(indices,i)
    }
  }
  return(indices)
}
