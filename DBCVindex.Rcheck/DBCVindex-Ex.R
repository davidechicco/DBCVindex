pkgname <- "DBCVindex"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "DBCVindex-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('DBCVindex')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("MST_Edges")
### * MST_Edges

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MST_Edges
### Title: Function that finds the list of MST edges
### Aliases: MST_Edges

### ** Examples

n = 300; noise = 0.05;
seed = 1782;
theta <- seq(0, pi, length.out = n / 2)
x1 <- cos(theta) + rnorm(n / 2, sd = noise)
y1 <- sin(theta) + rnorm(n / 2, sd = noise)
x2 <- cos(theta + pi) + rnorm(n / 2, sd = noise)
y2 <- sin(theta + pi) + rnorm(n / 2, sd = noise)
X <- rbind(cbind(x1, y1), cbind(x2, y2))
 y <- c(rep(0, n / 2), rep(1, n / 2))

nfeatures <- ncol(X)
i <- 1
clusters <- unique(y)
objcl <- which(y == clusters[i])
nuobjcl <- length(objcl)

noiseLabel <- -1
distX <- as.matrix(dist(X))^2
distXy <- distX[y != noiseLabel, y != noiseLabel]

mr <- matrix_mutual_reachability_distance(nuobjcl, distXy[objcl, objcl], nfeatures)

d_ucore_cl <- rep(0, nrow(X))
d_ucore_cl[objcl] <- mr$d_ucore
G <- list(no_vertices = nuobjcl, MST_edges = matrix(0, nrow = nuobjcl - 1, ncol = 3),
         MST_degrees = rep(0, nuobjcl), MST_parent = rep(0, nuobjcl))
g_start <- 1

mst_results <- MST_Edges(G, g_start, mr$G_edges_weights)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MST_Edges", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("dbcv_index")
### * dbcv_index

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: dbcv_index
### Title: Function that calculates the original Density-Based Clustering
###   Validation index (DBCV) of clustering results between -1 and +1
### Aliases: dbcv_index

### ** Examples


 n = 300; noise = 0.05;
 seed = 1782;
 theta <- seq(0, pi, length.out = n / 2)
 x1 <- cos(theta) + rnorm(n / 2, sd = noise)
 y1 <- sin(theta) + rnorm(n / 2, sd = noise)
 x2 <- cos(theta + pi) + rnorm(n / 2, sd = noise)
 y2 <- sin(theta + pi) + rnorm(n / 2, sd = noise)
 X <- rbind(cbind(x1, y1), cbind(x2, y2))
 y <- c(rep(0, n / 2), rep(1, n / 2))

cat("dbcv_index(X, y) = ", dbcv_index(X, y), "\n", sep="")




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("dbcv_index", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("matrix_mutual_reachability_distance")
### * matrix_mutual_reachability_distance

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: matrix_mutual_reachability_distance
### Title: Function that calculates the mutual reachability distance within
###   a matrix
### Aliases: matrix_mutual_reachability_distance

### ** Examples


 n = 300; noise = 0.05; seed = 1782;
 theta <- seq(0, pi, length.out = n / 2)
 x1 <- cos(theta) + rnorm(n / 2, sd = noise)
 y1 <- sin(theta) + rnorm(n / 2, sd = noise)
 x2 <- cos(theta + pi) + rnorm(n / 2, sd = noise)
 y2 <- sin(theta + pi) + rnorm(n / 2, sd = noise)
 X <- rbind(cbind(x1, y1), cbind(x2, y2))
 y <- c(rep(0, n / 2), rep(1, n / 2))

nfeatures <- ncol(X)
i <- 1
clusters <- unique(y)
objcl <- which(y == clusters[i])
nuobjcl <- length(objcl)

noiseLabel <- -1
distX <- as.matrix(dist(X))^2
distXy <- distX[y != noiseLabel, y != noiseLabel]

mr <- matrix_mutual_reachability_distance(nuobjcl, distXy[objcl, objcl], nfeatures)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("matrix_mutual_reachability_distance", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("norm_dbcv_index")
### * norm_dbcv_index

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: norm_dbcv_index
### Title: Function that calculates the normalized Density-Based Clustering
###   Validation index (DBCV) of clustering results between 0 and 1
### Aliases: norm_dbcv_index

### ** Examples


 n = 200; noise = 0.04;
 seed = 1783;
 theta <- seq(0, pi, length.out = n / 2)
 x1 <- cos(theta) + rnorm(n / 2, sd = noise)
 y1 <- sin(theta) + rnorm(n / 2, sd = noise)
 x2 <- cos(theta + pi) + rnorm(n / 2, sd = noise)
 y2 <- sin(theta + pi) + rnorm(n / 2, sd = noise)
 X <- rbind(cbind(x1, y1), cbind(x2, y2))
 y <- c(rep(0, n / 2), rep(1, n / 2))

cat("dbcv_index(X, y) = ", dbcv_index(X, y), "\n", sep="")




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("norm_dbcv_index", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
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
