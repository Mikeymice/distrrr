#' get_closest
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
get_closest <- function(point, data, top_k, dist="euclidean") {
  indices = vector('integer')
  return(indices)
}
