
#' get.delta.range
#'
#' Utility function to generate the delta axis
#'
#' @param data Data that contains 3 lower and upper variables
#' @param steps Size of the stride
#'
#' @return
#'
get.delta.range <- function(data, steps = 4) {

    lower <- floor(data$lower[3])
    upper <- ceiling(data$upper[3])
    diff <- upper - lower
    stride <- diff/steps


    return(c(lower, upper, stride))
}


#' plot.CI Plots two independent sample CI
#'
#' @param d Data Frame
#' @param titleScale Name of the Scale for the dependent Varialbe
#' @param delta a
#' @param range Axis Ranges
#' @param autorange
#'
#' @return
#'
# examples
plot.CI <- function(d, titleScale = "Dependent Variable", delta, range = c(1, 6), autorange = TRUE) {
    if (autorange) {
        range = c(0, max(c(d$upper[1:2], max(d$mean[1:2] + ceiling(d$upper[3])))))
    }

    delta <- get.delta.range(d)

    # set margins
    par(mar = c(3, 5, 3, 5))

    # generate Plot range 0.5 - 3.7
    plot(NA, xlim = c(0.5, 3.7), ylim = range, bty = "l", xaxt = "n", xlab = "", ylab = paste(titleScale, "(mean and 95% CI)"))
    # insert Dat Points
    points(d$mean[1:2], pch = 19)
    # Line to delta x=5, dashed
    segments(1, d$mean[1], 5, d$mean[1], lty = 2)
    segments(2, d$mean[2], 5, d$mean[2], lty = 2)

    # X axis
    axis(1, c(1, 2, 3.3), d$what)
    # CI of means
    segments(1:2, d$lower[1:2], 1:2, d$upper[1:2])
    ## Todo: ADD whiskers

    #print(delta)
    # delta axis
    axis(4.5, seq((d$mean[1] - delta[1]), (d$mean[1] - delta[2]), by = -delta[3]), seq(-delta[1], -delta[2], by = -delta[3]), las = 1)
    # Find height of mean difference in absolute scale
    adiffmean <- d$mean[1] + d$mean[3]

    # Print mean diff
    points(3.3, adiffmean, pch = 17, cex = 1.5)
    # segments(3,d$lower[3]+d$lower[2],3,d$lower[3]+d$upper[2], lwd=2)

    # Delta CI
    segments(3.3, d$mean[2] + d$mean[3] + d$lower[3], 3.3, d$mean[2] + d$mean[3] + d$upper[3], lwd = 2)
    # Delta Scale Label
    mtext("Difference in means", side = 4, at = d$mean[1], line = 3)

    # Title Print
    title(titleScale)
}



#' prepare.data
#'
#' Utility function used to create a data.frame that contains the values needed for a CI plot.
#'
#' @param lowerMean the lower mean
#' @param upperMean the upper mean
#' @param lowerSE the lower se
#' @param upperSE the upper se
#' @param diffLo the differences between the lows(?)
#' @param diffHigh the differnces between the highs(?)
#' @param labelA the label for a
#' @param labelB the label for b
#' @param title the title
#'
#' @return
#'
# @examples
prepare.data <- function(lowerMean, upperMean, lowerSE, upperSE, diffLo, diffHigh, labelA, labelB, title) {

    tempvalue <- c(lowerMean, upperMean)
    value <- c(tempvalue, (tempvalue[2] - tempvalue[1]))
    tempSE <- c(lowerSE, upperSE)

    ci <- tempSE * 1.96
    lo <- c(tempvalue - ci, diffLo)
    up <- c(tempvalue + ci, diffHigh)

    d = data.frame(what = c(labelA, labelB, "delta"), mean = value, lower = lo, upper = up)
    return(d)
}


#' mean.se
#'
#' Returns the standard error of a vector
#'
#' @param x data
#'
#' @return Standard error
#' @export
#'
#' @examples
#' mean_se(c(1, 2, 3, 4, 5, 6))
mean_se <- function(x){
    sd(x)/sqrt(length(x))

}


#' plot.IS.meansCI
#'
#' @param x vector of sample a
#' @param y vector of sample b
#' @param labelA label for variable a
#' @param labelB label for variable b
#' @param title Title for the plot
#' @param range Adjust the range of the plot
#'
#' @return plots
#' @export
#'
#' @examples
#' plot_IS_meansCI(c(1, 2, 3), c(3, 4, 5))
#'
plot_IS_meansCI <- function(x, y, labelA = "A", labelB = "B", title = "Dependent Variable", range = c(1, 0)) {
    t <- t.test(x, y)
    ci <- t$conf.int
    temp <- prepare.data(lowerMean = t$estimate[1], upperMean = t$estimate[2], lowerSE = mean_se(x), upperSE = mean_se(y), diffLo = ci[1],
        diffHigh = ci[2], labelA = labelA, labelB = labelB, title = title)

    # Should I autorange the plot?
    autorange <- T
    if (range[2] != 0)
        autorange <- F

    plot.CI(temp, range = range, autorange = autorange)
}

