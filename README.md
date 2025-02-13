# DBCVindex

## Summary ##

R package that computes the Density-Based Clustering Validation index (DBCV) index for assessing clustering results, following the R implementation of the `dbcv()` function of the  [clusterConfusion](https://github.com/pajaskowiak/clusterConfusion/blob/main/R/dbcv.R) software package by Pablo Andretta Jaskowiak.
The `dbcv()` function returns a value in the [-1;+1] interval: the higher, the better.

## Installation ##

To run `DBCVindex()`, you need to have the following programs and packages installed in your computer:

* R (version > 4.0)

You can install the `DBCVindex` package and its dependencies from [CRAN](https://cran.r-project.org/web/packages/DBCVindex/), and load it, with the following commands typed in the `R` terminal console:

    list.of.packages <- c("pacman")
    new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
    if(length(new.packages)) install.packages(new.packages, repos='http://cran.us.r-project.org')
    library("pacman")
    p_load("DBCVindex")

## Execution instructions ##

To run `DBCVindex()`,  you need a data parameter and its associated clustering labels.

## An example ##
An example on a random matrix:

    library("pacman")
    p_load("dbscan")
    p_load("DBCVindex")

    n = 300
    noise = 0.05
    seed = 1782;
    theta <- seq(0, pi, length.out = n / 2)
    x1 <- cos(theta) + rnorm(n / 2, sd = noise)
    y1 <- sin(theta) + rnorm(n / 2, sd = noise)
    x2 <- cos(theta + pi) + rnorm(n / 2, sd = noise)
    y2 <- sin(theta + pi) + rnorm(n / 2, sd = noise)
    X <- rbind(cbind(x1, y1), cbind(x2, y2)) # generate the X artificial data

    these_minimal_points <- 4
    hdbscan_clusters <- hdbscan(X, minPts = these_minimal_points)$cluster   # we apply HDBSCAN to X

    cat("dbcv_index(X, hdbscan_clusters) = ", dbcv_index(X, hdbscan_clusters), " in the [-1;+1] interval\n", sep="")

## Contacts ##

The `DBCVindex` package was developed by [Davide Chicco](https://www.DavideChicco.it). Questions should be addressed to davidechicco(AT)davidechicco.it
