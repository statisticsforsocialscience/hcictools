
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
#
# @examples
copy_labels <- function(from, to){
  warning("This is deprecated and will be removed in the next iteration. Use labelled::copy_labels.")
}
