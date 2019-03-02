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

  # raise error if point isn't class numeric
  if(class(point) != "numeric") stop("first argument point should be a numeric vector")

  # raise error if data isn't a data frame
  if(class(data) != "data.frame") stop("Second Argument data not a dataframe")

  # number of observations and columns in the data frame
  n <- dim(data)[1]
  k <- dim(data)[2]

  # raise error if point isn't length k
  if(length(point) != k) stop("Point should be length k, the number of columns of the input dataframe")

  # raise error if metric isn't correctly specified
  metrics <- c("euclidean","cosine","manhattan")
  if(!metric %in% metrics) stop("dist_type should be a string and one of 'cosine', 'euclidean' or 'manhattan'")

  # raise error if all elements of data aren't numeric
  # first extract type of each column in data frame
  # credit: https://stackoverflow.com/questions/21125222/determine-the-data-types-of-a-data-frames-columns
  data_col_classes <- unique(sapply(data,class))
  if(length(data_col_classes) != 1 & data_col_classes[1] != "numeric") stop("All elements of data should be numeric")

  # raise error if threshold isn't class numeric
  if(class(threshold) != "numeric") stop("threshold must be a numeric value")

  # raise error if threshold is not a single value
  if(length(threshold) != 1) stop("threshold must be a single value")

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
