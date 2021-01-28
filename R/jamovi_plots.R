#' Get ggplot object from jmv::ANOVA
#'
#' This function provides access to the emm plots of a jamovi ANOVA object
#'
#' @param jmv_result the result of a jmv::ANOVA call
#' @param plot_number the index of the emm plot to retrieve
#'
#' @return Returns a ggplot object
#' @importFrom jmv ANOVA
#' @export
#'
#' @examples
#' jmv_result <- jmv::ANOVA(
#'    data = ToothGrowth,
#'    dep = "len",
#'    factors = c("supp", "dose"),
#'    emMeans = list(
#'       c("dose", "supp"))
#'       )
#'
#' get_emm_plot(jmv_result)
get_emm_plot <- function(jmv_result, plot_number = 1) {
  l <- length(jmv_result$emm)
  if (plot_number > l) {
    stop("Plot with this number is not available.")
  }

  p <- jmv_result$emm[[l]]$emmPlot$plot$print()
  p
}





