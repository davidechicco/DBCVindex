# DBCVindex

## Summary ##

R package that computes the Density-Based Clustering Validation index (DBCV) index of clustering results, following the <https://github.com/FelSiq/DBCV> Python implementation by Felipe Alves Siqueira (@FelSiq).

## Installation ##

To run `DBCVindex()`, you need to have the following programs and packages installed in your computer:

* R (version > 4.0)
* R packages: `Matrix` `pacman` `stats`

You can install the `DBCVindex` package and its dependencies from CRAN, and load it, with the following commands typed in the `R` terminal console:

    R
    list.of.packages <- c("pacman")
    new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
    if(length(new.packages)) install.packages(new.packages, repos='http://cran.us.r-project.org')
    library("pacman")
    p_load("DBCVindex")

## Execution instructions ##

To run `DBCVindex()`,  you need a data parameter and its associated clustering labels.

## An example ##
An example on a random matrix:

    n = 300; noise = 0.05; seed = 1782;
    theta <- seq(0, pi, length.out = n / 2)
    x1 <- cos(theta) + rnorm(n / 2, sd = noise)
    y1 <- sin(theta) + rnorm(n / 2, sd = noise)
    x2 <- cos(theta + pi) + rnorm(n / 2, sd = noise)
    y2 <- sin(theta + pi) + rnorm(n / 2, sd = noise)
    X <- rbind(cbind(x1, y1), cbind(x2, y2))
    y <- c(rep(0, n / 2), rep(1, n / 2))

    cat("dbcv(X, y) = ", dbcv(X, y), "\n", sep="")

## Contacts ##

The `DBCVindex` package was developed by [Davide Chicco](https://www.DavideChicco.it). Questions should be addressed to davidechicco(AT)davidechicco.it
