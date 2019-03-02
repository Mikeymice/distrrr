
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

  # check for empty vector
  if(length(point1) == 0 ||  length(point2)==0 || is.null(point1) || is.null(point2))
  {
    stop("Input cannot be neigher empty vector nor NULL")
  }



  # check for numeric element

  if(!is.vector(point1, mode="numeric")  || !is.vector(point2, mode="numeric"))
  {
    stop("Input has to be vector containing numeric elements")
  }
  else
  {
    if(!length(point1) == length(point2))
    {
      stop("Inputs have different length")
    }
  }




  # check for unequal length



  return(function_list[[metric]](point1, point2)) # dummy result
}
