

#' draw.palette
#'
#' Utility function that draws a palette.
#'
#' @param col Palette vector
#' @param border Border used for plotting
#' @param ... Additional params forwarded to plot.
#'
#' @export
#'
# @examples
draw.palette <- function(col, border = "light gray", ...) {
  n <- length(col)
  graphics::plot(
    0,
    0,
    type = "n",
    xlim = c(0, 1),
    ylim = c(0, 1),
    axes = FALSE,
    xlab = "",
    ylab = "",
    ...
  )
  graphics::rect(0:(n - 1) / n, 0, 1:n / n, 1, col = col, border = border)
}



#' merge.type
#'
#' Merges two dataframes (I don't know what this was for. Will remove it soon.)
#'
#' @param d1 first data frame
#' @param d2 second data frame
#' @param ordered maintain the order?
#'
#' @export
#'
# @examples
merge_type <- function(d1, d2, ordered=FALSE){
  .Deprecated(msg = "This function is deprecated.")
}


#' converts rgb values to hex notation
#'
#' @param r red value
#' @param g green value
#' @param b blue value
rgb2hex <- function(r,g,b) {
  grDevices::rgb(r, g, b, maxColorValue = 255)
}






