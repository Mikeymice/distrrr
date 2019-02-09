#' Return distance/similarity metric for each row in a dataframe
#'
#' Created by Evan Yathon on 2019-02-08
#'
#' Compares an input reference vector to all rows of an input data frame, calculating the specified distance/similarity metric for each row.
#'
#' @param data pandas data frame of size n by k to compare ref_vec to
#' @param ref_vec vector of length k to compare to the data frame
#' @param dist_type string indicating type of distance metric
#'
#' @return numeric vector of length n
#' @export
#'
#' @examples
#'

get_all_distances <- function(data, ref_vec, dist_type = "euclidean"){

      return(as.numeric(c()))
}
