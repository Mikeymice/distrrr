#' filter_distances
#'
#' @param point Vector, values defining a single observation to compute distances for
#' @param data Dataframe, values of all observations to calculate distances from point
#' @param threshold float, maximum distance of observations to return indices for
#' @param dist Char, type of distance metric to use in distance calculations
#'
#' @return Vector, indices of the observations with distance less than `threshold` from `point`

#' @export
#'
#' @examples
#' df <- data.frame(x=c(1, 1), y=c(1,2))
#' filter_distances(c(1,1), df, 0.9)
#'
filter_distances <- function(point, data, threshold, dist="euclidean") {
  indices = vector('integer')
  return(indices)
}
