
#' Copy labels from one data set to another
#'
#' This is often used when merging data sets to ensure that the labels, still exist
#' after bind_rows
#'
#' @param from the source of the labels
#' @param to the target of the labels
#'
#' @return the labeled tibble
#' @export
#'
#' @examples
copy_labels <- function(from, to){
  varnames <- names(to)
  for (name in varnames) {
    to[name] <- set_label(to[name], get_label(from[name]))
    to[name] <- set_labels(to[name], labels=get_labels(from[name],include.values = T))
  }
  to
}
