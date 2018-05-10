cplot <- function(data) {
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
