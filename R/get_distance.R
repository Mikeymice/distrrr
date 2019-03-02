
# Helper functions


#' cd
#'
#' @param point1 vector with numeric values
#' @param point2 vector with numeric values
#'
#' @return float, the distance between point1 and point2 based on the cosine similarity
#' @export
#'
#' @examples
#'
#' cd(c(0,0,0), c(1,0,0))
#'
cd <- function(point1,point2){
  dp <- sum(point1*point2)
  amag <- sqrt(sum(point1^2))
  bmag <- sqrt(sum(point2^2))

  dp/(amag*bmag)
}

#' euc
#'
#' @param point1 vector with numeric values
#' @param point2 vector with numeric values
#'
#' @return float, the distance between point1 and point2 based on the euclidean
#' @export
#'
#' @examples
#'
#' euc(c(0,0,0), c(1,0,0))
#'
euc <- function(point1,point2){
  sqrt(sum((point1-point2)^2))
}

#' man
#'
#' @param point1 vector with numeric values
#' @param point2 vector with numeric values
#'
#' @return float, the distance between point1 and point2 based on the manhattan
#' @export
#'
#' @examples
#'
#' man(c(0,0,0), c(1,0,0))
#'
man <- function(point1,point2){
  sum(abs(point1-point2))
}



#' get_distance
#'
#' @param point1 vector with numeric values
#' @param point2 vector with numeric values
#' @param metric default "euclidean", "cosine" will return cosine similiarity distance, and "manhattan" will return manhattan distance
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



  # check for numeric vector first then check for equal length

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

  if(! metric %in% names(function_list) )
    stop("Metric needs to be one of 'euclidean', 'cosine' or 'manhattan'")



  return(function_list[[metric]](point1, point2)) # dummy result
}
