#' return the delta-ranges for automatic delta axis size
getDeltaRange <- function(data, steps = 4) {

    l <- floor(data$lower[3])
    o <- ceiling(data$upper[3])
    diff <- o - l
    stride <- diff/steps


    return(c(l, o, stride))
}

#' Print a CI Interval for a given set of data
#'
printCI <- function(d, titleScale = "Dependent Variable", delta, range = c(1, 6), autorange = TRUE) {
    if (autorange) {
        range = c(0, max(c(d$upper[1:2], max(d$mean[1:2] + ceiling(d$upper[3])))))
    }

    delta <- getDeltaRange(d)

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

    print(delta)
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


#' helper function that creates the data for the printCI call
createData <- function(lowerMean, upperMean, lowerSE, upperSE, diffLo, diffHigh, labelA, labelB, title) {

    tempvalue <- c(lowerMean, upperMean)
    value <- c(tempvalue, (tempvalue[2] - tempvalue[1]))
    tempSE <- c(lowerSE, upperSE)

    ci <- tempSE * 1.96
    lo <- c(tempvalue - ci, diffLo)
    up <- c(tempvalue + ci, diffHigh)

    d = data.frame(what = c(labelA, labelB, "delta"), mean = value, lower = lo, upper = up)
    return(d)
}




#' print a CI plot from two different means
independentSampleMeansCI <- function(data1, data2, labelA = "A", labelB = "B", title = "Dependent Variable", range = c(1, 0)) {
    t <- t.test(data1, data2)
    ci <- t$conf.int
    temp <- createData(lowerMean = mean(data1), upperMean = mean(data2), lowerSE = stderr(data1), upperSE = stderr(data2), diffLo = ci[1],
        diffHigh = ci[2], labelA = labelA, labelB = labelB, title = title)
    printCI(temp, range = range)
}

