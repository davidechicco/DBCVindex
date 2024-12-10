pkgname <- "DBCVindex"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('DBCVindex')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("compute_pair_to_pair_dists")
### * compute_pair_to_pair_dists

flush(stderr()); flush(stdout())

### Name: compute_pair_to_pair_dists
### Title: Function to compute pairwise distances and ensure matrix format
### Aliases: compute_pair_to_pair_dists

### ** Examples


n = 300; noise = 0.05; seed = 1782;
theta <- seq(0, pi, length.out = n / 2)
 x1 <- cos(theta) + rnorm(n / 2, sd = noise)
 y1 <- sin(theta) + rnorm(n / 2, sd = noise)
 x2 <- cos(theta + pi) + rnorm(n / 2, sd = noise)
 y2 <- sin(theta + pi) + rnorm(n / 2, sd = noise)
 X <- rbind(cbind(x1, y1), cbind(x2, y2))

dist_matrix <- compute_pair_to_pair_dists(X)



cleanEx()
nameEx("dbcv")
### * dbcv

flush(stderr()); flush(stdout())

### Name: dbcv
### Title: Function that calculates the Density-Based Clustering Validation
###   index (DBCV) of clustering results
### Aliases: dbcv

### ** Examples


n = 300; noise = 0.05; seed = 1782;
theta <- seq(0, pi, length.out = n / 2)
 x1 <- cos(theta) + rnorm(n / 2, sd = noise)
 y1 <- sin(theta) + rnorm(n / 2, sd = noise)
 x2 <- cos(theta + pi) + rnorm(n / 2, sd = noise)
 y2 <- sin(theta + pi) + rnorm(n / 2, sd = noise)
 X <- rbind(cbind(x1, y1), cbind(x2, y2))
 y <- c(rep(0, n / 2), rep(1, n / 2))

cat("dbcv(X, y) = ", dbcv(X, y), "\n", sep="")



cleanEx()
nameEx("remove_duplicates")
### * remove_duplicates

flush(stderr()); flush(stdout())

### Name: remove_duplicates
### Title: Function to remove duplicate samples from the input data
### Aliases: remove_duplicates

### ** Examples


n = 300; noise = 0.05; seed = 1782;
theta <- seq(0, pi, length.out = n / 2)
 x1 <- cos(theta) + rnorm(n / 2, sd = noise)
 y1 <- sin(theta) + rnorm(n / 2, sd = noise)
 x2 <- cos(theta + pi) + rnorm(n / 2, sd = noise)
 y2 <- sin(theta + pi) + rnorm(n / 2, sd = noise)
 X <- rbind(cbind(x1, y1), cbind(x2, y2))
 y <- c(rep(0, n / 2), rep(1, n / 2))

cat("remove_duplicates(X, y) = ")
print(remove_duplicates(X, y))



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
