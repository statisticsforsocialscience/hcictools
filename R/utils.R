#' Helper function to return factors as numerics
#'
as.numeric.factor <- function(x) {
  if (is.numeric(x)){
    return(x)
  } else
    seq_along(levels(x))[x]

}

#' Draws a palette plot
#'
pal <- function(col, border = "light gray", ...) {
  n <- length(col)
  plot(0, 0, type="n", xlim = c(0, 1), ylim = c(0, 1),
       axes = FALSE, xlab = "", ylab = "", ...)
  rect(0:(n-1)/n, 0, 1:n/n, 1, col = col, border = border)
}


#' merges two datasets and determine ordering or not by parameter
#' must ensure both datasets are compatible
mergeType <- function(d1,d2,ordered=FALSE){
  if(ordered){
    data <- rbind(d1,d2)
  }
  else {
    data <- merge.ordered(d1,d2)
  }
  return(data)
}


#' calculates the standard_error of a mean
stderr <- function(x) sqrt(var(x,na.rm=TRUE)/length(na.omit(x)))
