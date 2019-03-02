#' Return distance/similarity metric for each row in a dataframe
#'
#' Created by Evan Yathon on 2019-02-08
#'
#' Compares an input reference vector to all rows of an input data frame, calculating the specified distance/similarity metric for each row.
#'
#' @param point vector of length k to compare to the data frame
#' @param data data frame of size n by k to compare ref_vec to
#' @param metric string, default value "euclidean" for euclidean distance, "cosine" will return cosine similiarity distance, and "manhattan" will return manhattan distance
#'
#' @return numeric vector of length n
#'
#' @export
#'
#' @examples
#' df <- data.frame("A" = c(1,2,3), "B" = c(8,2,4))
#' ref_vec <- c(-2,4)
#'

get_all_distances <- function(point, data, metric = "euclidean"){

  # raise error if point isn't class numeric
  if(class(point) != "numeric") stop("first argument point should be a numeric vector")

  # raise error if data isn't a data frame
  if(class(data) != "data.frame") stop("Second Argument data not a dataframe")

  # number of observations and columns in the data frame
  n <- dim(data)[1]
  k <- dim(data)[2]

  # empty distances vector to fill
  distances <- numeric(n)

  for(obs in 1:n){
    distances[obs] <- get_distance(point, data[obs,], metric)
  }

  return(distances)
}
