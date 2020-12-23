
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hcictools

<!-- badges: start -->

<!-- badges: end -->

The goal of hcictools is to make frequently recurring tasks in our work
easier.

## Installation

You can install the released version of hcictools from
[CRAN](https://CRAN.R-project.org) with:

``` r
# install.packages("remotes")
remotes::install_github("statisticsforsocialscience/hcictools")
```

## Package Contents

This is a package that contains helpful functions for survey data
analysis. It is maintained by the Human-Computer Interaction Center at
RWTH Aachen University.

## Installing the package

You can install this packages by running the following code.

``` r
  install.packages("remotes")
  remotes::install_github("HCIC/r-tools")
```

## Plotting Features

### Correlation Plots

``` r
a <- c(1,2,3,8,4,5,6,7)
b <- c(4,5,6,7,3,8,9,10)
d <- c(4,2,5,2,5,2,1,5)
df <- data.frame(a = a, b = b, d = d)

cor.matrix.plot(df)
```

<img src="man/figures/README-corplots-1.png" width="100%" />

### Confidence Interval Plots

It has a confidence interval plotting feature for indepedent sample
tests.

``` r

plot_IS_meansCI(a, b)
```

<img src="man/figures/README-ci-plot-1.png" width="100%" />

## RWTH Palette

Drawing palettes and RWTH Corporate CI Colors

``` r

draw.palette(unlist( rwth.colorpalette() ))
```

<img src="man/figures/README-corporate-1.png" width="100%" />

## auto-code scale

Automatically extract item orientation and create mean score of items
that have a prefix.

``` r
psych::bfi %>% head(50) %>% auto_score("A")
#>    A1 A2 A3 A4 A5 age
#> 1   2  4  3  4  4  16
#> 2   2  4  5  2  5  18
#> 3   5  4  5  4  4  17
#> 4   4  4  6  5  5  17
#> 5   2  3  3  4  5  17
#> 6   6  6  5  6  5  21
#> 7   2  5  5  3  5  18
#> 8   4  3  1  5  1  19
#> 9   4  3  6  3  3  19
#> 10  2  5  6  6  5  17
#> 11  4  4  5  6  5  21
#> 12  2  5  5  5  5  16
#> 13  5  5  5  6  4  16
#> 14  5  5  5  6  6  16
#> 15  4  5  2  2  1  17
#> 16  4  3  6  6  3  17
#> 17  4  6  6  2  5  17
#> 18  5  5  5  4  5  17
#> 19  4  4  5  4  3  16
#> 20  4  4  6  5  5  17
#> 21  5  4  2  1  2  17
#> 22  1  6  6  1  5  17
#> 23  1  5  6  5  6  68
#> 24  2  6  5  6  5  27
#> 25  4  5  5  6  5  18
#> 26  1  6  6  1  6  20
#> 27  2  4  4  4  3  51
#> 28  2  5  6  6  6  14
#> 29  2  5  1  3  5  33
#> 30  4  5  6  5  5  18
#> 31  1  6  5  6  3  17
#> 32  2  5  6  6  6  41
#> 33  1  5  6  5  4  23
#> 34  2  4  5  6  5  17
#> 35  4  4  4  4  4  20
#> 36  5  3  5  4  2  23
#> 37  1  6  4  6  4  20
#> 38  1  4  4  2  3  21
#> 39  1  6  6  6  6  30
#> 40  1  5  4  3  5  48
#> 41  1  5  5  6  5  40
#> 42  5  4  3  6  4  27
#> 43  1  5  4  4  5  18
#> 44  5  6  4  3  5  20
#> 45  2  6  6  6  6  24
#> 46  1  6  6  6  6  25
#> 47  5  5  3  4  3  22
#> 48  2  6  4  5  5  18
#> 49  1  5  3  2  3  43
#> 50  1  6  6  6  6  20
#> 
#> Reliability analysis   
#> Call: psych::alpha(x = intermediate, check.keys = TRUE, warnings = FALSE)
#> 
#>   raw_alpha std.alpha G6(smc) average_r S/N   ase mean  sd median_r
#>       0.22      0.64    0.67      0.23 1.8 0.093   18 2.1     0.27
#> 
#>  lower alpha upper     95% confidence boundaries
#> 0.03 0.22 0.4 
#> 
#>  Reliability if an item is dropped:
#>     raw_alpha std.alpha G6(smc) average_r  S/N alpha se var.r med.r
#> A1-      0.11      0.60    0.62      0.23 1.49    0.100 0.043  0.20
#> A2       0.19      0.58    0.61      0.22 1.38    0.091 0.040  0.24
#> A3       0.20      0.58    0.60      0.22 1.40    0.081 0.033  0.22
#> A4       0.20      0.65    0.67      0.27 1.89    0.085 0.038  0.30
#> A5       0.16      0.49    0.50      0.16 0.95    0.084 0.025  0.13
#> age      0.64      0.67    0.68      0.29 2.06    0.082 0.033  0.32
#> 
#>  Item statistics 
#>      n raw.r std.r r.cor r.drop mean    sd
#> A1- 50  0.53  0.61  0.49   0.42 66.2  1.60
#> A2  50  0.29  0.64  0.55   0.22  4.8  0.95
#> A3  50  0.22  0.64  0.56   0.11  4.7  1.36
#> A4  50  0.22  0.48  0.30   0.09  4.4  1.61
#> A5  50  0.40  0.80  0.81   0.31  4.4  1.30
#> age 50  0.94  0.43  0.24   0.18 23.0 10.75
#> 
#> Non missing response frequency for each item
#>       1    2    3    4    5    6 miss
#> A1 0.28 0.28 0.00 0.24 0.18 0.02    0
#> A2 0.00 0.00 0.10 0.26 0.38 0.26    0
#> A3 0.04 0.04 0.10 0.16 0.32 0.34    0
#> A4 0.06 0.10 0.10 0.20 0.16 0.38    0
#> A5 0.04 0.04 0.16 0.14 0.44 0.18    0
#> 
#> Adding scores for the A scale.
#> 
#> ===============================================================
#> 
#> ---------------------------------------------------Testing keys
#> Reliability analysis   
#>  raw_alpha std.alpha G6(smc) average_r S/N   ase mean  sd median_r
#>       0.22      0.64    0.67      0.23 1.8 0.093   18 2.1     0.27
#> 
#> ------------------------------------------------Possible drops?
#>     raw_alpha std.alpha   G6(smc) average_r       S/N   alpha se      var.r
#> age 0.6401512 0.6735669 0.6765065 0.2921271 2.0634151 0.08165305 0.03274543
#> A4  0.2039064 0.6541140 0.6725009 0.2744292 1.8911263 0.08524789 0.03775861
#> A3  0.2014994 0.5838783 0.5972353 0.2191335 1.4031431 0.08112586 0.03278488
#> A2  0.1909211 0.5791379 0.6054611 0.2158186 1.3760754 0.09053765 0.04011820
#> A5  0.1579202 0.4883062 0.4966575 0.1602698 0.9542936 0.08427459 0.02453107
#> A1- 0.1088703 0.5979811 0.6158001 0.2292806 1.4874455 0.10018208 0.04319743
#>         med.r
#> age 0.3202747
#> A4  0.3022303
#> A3  0.2217505
#> A2  0.2368598
#> A5  0.1280172
#> A1- 0.1979787
#> 
#> ---------------------------------------------------Calculating scale
#> Call: psych::scoreItems(keys = keys, items = data_set, min = 1, max = 6)
#> 
#> (Unstandardized) Alpha:
#>          A
#> alpha 0.22
#> 
#> Standard errors of unstandardized Alpha:
#>          A
#> ASE   0.13
#> 
#> Average item correlation:
#>               A
#> average.r 0.044
#> 
#> Median item correlation:
#>    A 
#> 0.27 
#> 
#>  Guttman 6* reliability: 
#>             A
#> Lambda.6 0.32
#> 
#> Signal/Noise based upon av.r : 
#>                 A
#> Signal/Noise 0.27
#> 
#> Scale intercorrelations corrected for attenuation 
#>  raw correlations below the diagonal, alpha on the diagonal 
#>  corrected correlations above the diagonal:
#>      A
#> A 0.22
#> 
#>  In order to see the item by scale loadings and frequency counts of the data
#>  print with the short option = FALSE
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#>    A1 A2 A3 A4 A5 C1 C2 C3 C4 C5 E1 E2 E3 E4 E5 N1 N2 N3 N4 N5 O1 O2 O3 O4 O5
#> 1   2  4  3  4  4  2  3  3  4  4  3  3  3  4  4  3  4  2  2  3  3  6  3  4  3
#> 2   2  4  5  2  5  5  4  4  3  4  1  1  6  4  3  3  3  3  5  5  4  2  4  3  3
#> 3   5  4  5  4  4  4  5  4  2  5  2  4  4  4  5  4  5  4  2  3  4  2  5  5  2
#> 4   4  4  6  5  5  4  4  3  5  5  5  3  4  4  4  2  5  2  4  1  3  3  4  3  5
#> 5   2  3  3  4  5  4  4  5  3  2  2  2  5  4  5  2  3  4  4  3  3  3  4  3  3
#> 6   6  6  5  6  5  6  6  6  1  3  2  1  6  5  6  3  5  2  2  3  4  3  5  6  1
#> 7   2  5  5  3  5  5  4  4  2  3  4  3  4  5  5  1  2  2  1  1  5  2  5  6  1
#> 8   4  3  1  5  1  3  2  4  2  4  3  6  4  2  1  6  3  2  6  4  3  2  4  5  3
#> 9   4  3  6  3  3  6  6  3  4  5  5  3 NA  4  3  5  5  2  3  3  6  6  6  6  1
#> 10  2  5  6  6  5  6  5  6  2  1  2  2  4  5  5  5  5  5  2  4  5  1  5  5  2
#> 11  4  4  5  6  5  4  3  5  3  2  1  3  2  5  4  3  3  4  2  3  5  3  5  6  3
#> 12  2  5  5  5  5  5  4  5  4  5  3  3  4  5  4  4  5  3  2 NA  4  6  4  5  4
#> 13  5  5  5  6  4  5  4  3  2  2  3  3  3  2  4  1  2  2  2  2  4  2  4  5  2
#> 14  5  5  5  6  6  4  4  4  2  1  2  2  4  6  5  1  1  1  2  1  5  3  4  4  4
#> 15  4  5  2  2  1  5  5  5  2  2  3  4  3  6  5  2  4  2  2  3  5  2  5  5  5
#> 16  4  3  6  6  3  5  5  5  3  5  1  1  6  6  4  4  5  4  5  5  6  6  6  3  2
#> 17  4  6  6  2  5  4  4  4  4  4  1  2  5  5  5  4  4  4  4  5  5  1  5  6  3
#> 18  5  5  5  4  5  5  5  5  4  3  2  2  4  6  6  6  5  5  4  4  5  1  4  5  4
#> 19  4  4  5  4  3  5  4  5  4  6  1  2  4  5  5  5  6  5  5  2  4  2  2  4  2
#> 20  4  4  6  5  5  1  1  1  5  6  1  1  4  5  6  5  5  5  1  1  4  1  5  3  2
#> 21  5  4  2  1  2  4  6  5  5  4  3  3  5  5  4  1  3  3  2  1  6  1  3  2  4
#> 22  1  6  6  1  5  5  4  4  2  3  1  2  4  3  4  2  5  5  4  6  5  1  6  6  2
#> 23  1  5  6  5  6  4  3  2  4  5  2  1  2  5  2  2  2  2  2  2  6  1  5  5  2
#> 24  2  6  5  6  5  3  5  6  3  6  2  2  4  6  6  4  4  4  6  6  6  1  5  6  1
#> 25  4  5  5  6  5  5  5  4  1  1  3  2  5  5  6  2  3  3  1  1  6  2  5  6  2
#> 26  1  6  6  1  6  5  2  5  1  1  1  1  6  6  6  2  3  1  2  1  6  4  5  5  3
#> 27  2  4  4  4  3  6  5  6  1  1  2  4  4  2  6  3  3  5  3  2  5  2  6  6  1
#> 28  2  5  6  6  6  4  5  4  3  4  1  2  6  6  6  4  4  5  2  3  6  1  6  4  3
#> 29  2  5  1  3  5  5  4  5  2  5  1  2  6  5  4  1  4  2  2  5  2  4  5  4  1
#> 30  4  5  6  5  5  5  5  3  5  4  1  2  6  5  5  5  4  4  3  1  4  4  6  5  1
#> 31  1  6  5  6  3  5  5  5  4  3  2  5  1  5  3  5  5  5  6  6  4  3  3  6  5
#> 32  2  5  6  6  6  5  5  5  2  4  1  2  4  5  5  3  2  4  1  2  5  2  5  5  2
#> 33  1  5  6  5  4  1  5  6  4  6  6  6  2  1  1  1  2  1  3  6  6  6  5  6  1
#> 34  2  4  5  6  5  4  6  4  2  4  2  2  3  5  3  2  2  4  1  3  5  5  5  4  2
#> 35  4  4  4  4  4  4  3  3  3  4  2  3  4  2  3 NA  2  1  2  2  4  3  5  5  3
#> 36  5  3  5  4  2  2  2  4  3  4  3  4  3  2  3  5  3  4  4  3  4  5  4  4  3
#> 37  1  6  4  6  4  5  6  3  1  5  6  6  3  2  2  2  2  2  4  1  5  5  4  5  3
#> 38  1  4  4  2  3  6  5  6  3  4  3  4  3  3  5  5  6  5  5  4  5  5  4  5  2
#> 39  1  6  6  6  6  6  6  6  1  1  1  1  1  6  6  1  1  1  1  1  6  1  6  6  1
#> 40  1  5  4  3  5  6  5  5  2  2  3  2  3  6  5  1  2  1  2  1  5  1  6  6  1
#> 41  1  5  5  6  5  4  4  4  3  4  4  3  4  4  4  2  2  3  3  3  4  3  2  5  2
#> 42  5  4  3  6  4  5  2  5  2  4  6  4  2  4  4  1  2  1  2 NA  3  3  2  2  5
#> 43  1  5  4  4  5  4  5  4  3  3  3  3  2  5  4  2  3  1  3  2  4  3  5  4  3
#> 44  5  6  4  3  5  5  3  3  4  5  6  4  4  4  3  2  2  3  4  5  3  5  4  4  4
#> 45  2  6  6  6  6  5  4  5  3  4  2  2  4  5  5  2  2  2  2  3  5  2  5  5  1
#> 46  1  6  6  6  6  5  2  1  2  1  6  5  6  6  5  2  1  4  6  5  6  5  6  6  1
#> 47  5  5  3  4  3  4  4  3  4  5  4  4  5  2  4  4  5  3  5  2  3  5  4  4  2
#> 48  2  6  4  5  5  3  2  3  4  6  2  4  2  4  4  3  4  2  2  4  5  4  5  3  2
#> 49  1  5  3  2  3  3  6  3  1  3  5  5  5  5  3  5  5  5  5  3  3  3  2  5  1
#> 50  1  6  6  6  6  5  5  4  1  2  1  1  6  6  6  4  4  1  1  1  6  3  6  6  1
#>    gender education age         A
#> 1       1        NA  16  6.000000
#> 2       2        NA  18  6.500000
#> 3       2        NA  17  6.000000
#> 4       2        NA  17  6.666667
#> 5       1        NA  17  6.166667
#> 6       2         3  21  7.333333
#> 7       1        NA  18  6.833333
#> 8       1         2  19  5.333333
#> 9       1         1  19  6.166667
#> 10      2        NA  17  7.333333
#> 11      1         1  21  7.333333
#> 12      1        NA  16  6.833333
#> 13      2        NA  16  6.333333
#> 14      1        NA  16  6.666667
#> 15      1         1  17  5.000000
#> 16      1        NA  17  6.333333
#> 17      2        NA  17  6.500000
#> 18      1        NA  17  6.333333
#> 19      2        NA  16  5.833333
#> 20      2        NA  17  6.666667
#> 21      1        NA  17  4.666667
#> 22      2        NA  17  6.833333
#> 23      1         5  68 16.000000
#> 24      2         2  27  9.000000
#> 25      1         1  18  7.000000
#> 26      2         3  20  7.500000
#> 27      2         5  51 11.833333
#> 28      2        NA  14  7.000000
#> 29      2         3  33  8.666667
#> 30      2         3  18  7.000000
#> 31      2        NA  17  7.166667
#> 32      2         3  41 11.500000
#> 33      1         5  23  8.166667
#> 34      2        NA  17  7.000000
#> 35      1         3  20  6.500000
#> 36      1         3  23  6.500000
#> 37      1         3  20  7.666667
#> 38      1         3  21  6.666667
#> 39      1        NA  30 10.000000
#> 40      2         5  48 11.833333
#> 41      2         3  40 11.166667
#> 42      2         4  27  7.666667
#> 43      1         1  18  7.000000
#> 44      1         4  20  6.666667
#> 45      2         5  24  8.833333
#> 46      1         3  25  9.166667
#> 47      1         2  22  6.500000
#> 48      2         1  18  7.166667
#> 49      2         1  43 10.333333
#> 50      1         3  20  8.333333
```

## TBC More to follow
