#' cor.matrix.plot
#'
#' Plots a correlation matrix plot. The to
#'
#' @param data Data frame to plot. Use dplyer::select to filter variables to use.
#' @param conf.level Level of significance (default .95)
#'
#' @return
#' @importFrom magrittr "%>%"
#' @export
#'
#' @examples
#' cars %>% dplyr::select(speed, dist) %>% cor.matrix.plot()
#'
cor.matrix.plot <- function(data) {
  rwthcolors <- rwth.colorpalette()
  p <- corrplot::cor.mtest(data, conf.level = .95)
  col <- colorRampPalette(c(rwthcolors$red, "#FFFFFF", rwthcolors$blue))
  cor(data, use = "pairwise.complete.obs") %>% corrplot::corrplot( method = "color", col = col(200),
                                                         type = "upper", order = "hclust", number.cex = .7,
                                                         addCoef.col = "black", # Add coefficient of correlation
                                                         tl.col = "black", tl.srt = 90, # Text label color and rotation
                                                         # Combine with significance
                                                         p.mat = p$p, sig.level = c(.001, .01, .05), insig = "n",
                                                         # hide correlation coefficient on the principal diagonal
                                                         diag = TRUE, tl.pos = "lt")
  cor(data, use = "pairwise.complete.obs") %>% corrplot::corrplot( method = "color", col = col(200),
                                                         type = "lower", order = "hclust", number.cex = .7,
                                                         #addCoef.col = "black", # Add coefficient of correlation
                                                         #tl.col = "black", tl.srt = 90, # Text label color and rotation
                                                         # Combine with significance
                                                         p.mat = p$p, sig.level = c(.001, .01, .05), insig = "label_sig",
                                                         pch.cex = 0.8,
                                                         # hide correlation coefficient on the principal diagonal
                                                         diag = TRUE, add=TRUE, tl.pos = "n")

}
