# M&Ms distribution example
# =========================
# 
# M&M sample statistics case
#   R=Red
# 	G=Green	
# 	B=Blue
# 	Y=Yellow
# 	O=Orange
# 	D=Dark brown
# 
# suppose for example:
# 
# R  3
# G  1
# B  4
# Y  5
# O  3
# D  4
# 
#   20 total
#
# 
# clear the workspace
rm(list=ls())

simpleDist=FALSE;
n = 1000;

# Let's randomly generate some counts of different colored MMs and put the data in a matrix.
# I've completely fabricated these: we take 10 randomly-sampled numbers between 0 and 6 to see what we get.
# I want to have 10 sets of observations. Each set consists of different colors in different abundances.
if (simpleDist==TRUE) {
  red <- sample(0:6, n, replace=TRUE)
  blue <- sample(0:6, n, replace=TRUE)
  green <- sample(0:6, n, replace=TRUE)
  yellow <- sample(0:6, n, replace=TRUE)
  orange <- sample(0:6, n, replace=TRUE)
  brown <- sample(0:6, n, replace=TRUE)
} else {
  # or we can play with the distributions a bit...

  probVec1 <- c(0.1, 0.15, 0.3, 0.25, 0.15, 0.05, 0.0); # opposite of brown; skewed low
  red <- sample(0:6, n, prob=probVec1, replace=TRUE)
  
  probVec2 <- c(0.1, 0.15, 0.25, 0.25, 0.15, 0.05, 0.05); # skewed slightly low
  blue <- sample(0:6, n, prob=probVec2, replace=TRUE)
  
  probVec3 <- c(0.05, 0.1, 0.2, 0.3, 0.2, 0.1, 0.05);
  green <- sample(0:6, n, prob=probVec3, replace=TRUE)
  
  probVec4 <- c(0.05, 0.1, 0.2, 0.3, 0.2, 0.1, 0.05);
  yellow <- sample(0:6, n, prob=probVec4, replace=TRUE)
  
  probVec5 <- c(0.05, 0.05, 0.15, 0.25, 0.3, 0.15, 0.05);
  orange <- sample(0:6, n, prob=probVec5, replace=TRUE) #skewed slightly high
  
  probVec6 <- c(0.0, 0.05, 0.15, 0.25, 0.3, 0.15, 0.1); # skewed high
  brown <- sample(0:6, n, prob=probVec6, replace=TRUE)
}

# names of the columns:
mmc = c("red", "blue", "green", "yellow", "orange", "brown");

# create as a matrix, the better to plot it using boxplot()
mm = matrix( data=c(red, blue, green, yellow, orange, brown), # use the data generated above 
             nrow=n,                      # create 10 rows
             ncol=6,                      # create 6 columns
             byrow=FALSE,                 # fill the matrix by column
             dimnames=list(c(1:n),mmc) ) # names of the dimensions, rows, then columns

str(mm)
# int [1:10, 1:6] 4 6 1 3 6 5 3 4 5 3 ...
# - attr(*, "dimnames")=List of 2
# ..$ : chr [1:10] "1" "2" "3" "4" ...
# ..$ : chr [1:6] "red" "blue" "green" "yellow" ...

rownames(mm)
#  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"
colnames(mm)
# [1] "red"    "blue"   "green"  "yellow" "orange" "brown" 

# ---- Summary and descriptive stats for matrix work just as they would for a data frame --------

mm
#    red blue green yellow orange brown
# 1    3    5     5      2      0     1
# 2    2    2     6      2      3     4
# 3    1    3     5      1      1     6
# 4    5    1     0      6      2     6
# 5    6    1     6      6      3     1
# 6    1    6     5      0      6     5
# 7    0    1     6      3      5     0
# 8    2    3     4      5      2     6
# 9    2    6     2      2      0     0
# 10   6    4     4      4      1     3

# How many of each MM in an average package?

cmeans <- colMeans(mm)
cmeans
#    red   blue  green yellow orange  brown 
#    2.8    3.2    4.3    3.1    2.3    3.2 

# summary of the dataset by MM color:

summary(mm)
#       red            blue          green          yellow         orange        brown     
#  Min.   :0.00   Min.   :1.00   Min.   :0.00   Min.   :0.00   Min.   :0.0   Min.   :0.00  
#  1st Qu.:1.25   1st Qu.:1.25   1st Qu.:4.00   1st Qu.:2.00   1st Qu.:1.0   1st Qu.:1.00  
#  Median :2.00   Median :3.00   Median :5.00   Median :2.50   Median :2.0   Median :3.50  
#  Mean   :2.80   Mean   :3.20   Mean   :4.30   Mean   :3.10   Mean   :2.3   Mean   :3.20  
#  3rd Qu.:4.50   3rd Qu.:4.75   3rd Qu.:5.75   3rd Qu.:4.75   3rd Qu.:3.0   3rd Qu.:5.75  
#  Max.   :6.00   Max.   :6.00   Max.   :6.00   Max.   :6.00   Max.   :6.0   Max.   :6.00  
# 
# How many MMs per package, on average? 

rsums <- rowSums(mm)
rsums
#  [1] 16 19 17 20 23 23 15 22 12 22

mrsums <- mean(rowSums(mm))
mrsums
# [1] 18.9

# ----- plot the number of MMs per package, overplot avg number of MMs per package ----

# reset the par() number of plots per window
par(mfrow=c(1,1), pch=1)

plot(rsums,
     ylab="number of M&Ms in package", 
     xlab="sample number",
     main="number of M&Ms in package, across dataset",
     ylim=c(0,max(rsums)+1)     
     )
abline(h=c(rep(mrsums,n)),col="blue")

# how many of each color per package, on average?

rmeans <- rowMeans(mm)
rmeans
#  [1] 2.666667 3.166667 2.833333 3.333333 3.833333 3.833333 2.500000 3.666667 2.000000
# [10] 3.666667


# look at what's in the first "observation" or sample:
mm[1,]
#   red blue green yellow orange brown
# 1   3    5     5      2      0     1

# --------------- histograms of color frequency across dataset -----------------------

# histograms of different colors across the samples of the dataset
#
# note: range same for all plots, for direct comparison

par(mfrow=c(2,3))

for (i in 1:6) {
  
  xLabel=paste("number of", mmc[i], "M&Ms in sample")  # x label
  hist(mm[,i],                                         # data to plot
       ylab="number of samples", 
       xlab=xLabel,
       main=" ",                                       # suppress the title
       col=c(mmc[i]),                                  # color of the histogram bars--constant per plot
       breaks=c(-0.25:7.5),                            # location of the bins (as vector)
       include.lowest=FALSE)                             
}
title(main="Histograms of M&Ms by color")

# --------------- barplots of color abundances for each sample -----------------------

# now look at (some) of the distributions, on a single plot:

# put 3 columns, 3 rows of plots in one:
par(mfrow=c(3,3))

# make barplot for 9 samples:
for (i in 1:9) {
  barplot(mm[i,],                  # data to plot
          names.arg=mmc,           # names along the x axis
          col=mmc,                 # colors for the bars
          ylab="count",            # y label
          main=paste("Sample #",i, ":", sum(mm[i,]), "M&Ms"))  # main title
}

