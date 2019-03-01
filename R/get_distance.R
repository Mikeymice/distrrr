
# Helper functions

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



#' get_distance
#'
#' @param point1 vector with numeric values
#' @param point2 vector with numeric values
#' @param metric defuault "euclidean", "cosine" will return cosine similiarity distnace, and "manhhantan" will return manhhantan distance
#'
#' @return float, the distance between point1 and point2 based on the metric given
#' @export
#'
#' @examples
#'
#' get_distance(c(0,0,0), c(1,0,0))
#'
get_distance <- function(point1, point2, metric = "euclidean")
{
  function_list  <- list("cosine" = cd,  "euclidean" = euc, "manhattan" = man)


  return(function_list[[metric]](point1, point2)) # dummy result
}
