# histogram2-binning-Cars93.R
#
# histograms continued: exploring histogram binning

library(MASS)
cr = Cars93

# ---------------------------------------------------------------
# histogram: how many examples in the dataset fall into each "bin"
#   of a fixed size. This lets us look at the distribution of one
#   variable in the dataset at a time.
#
#   - y axis shows the counts in a given "bin". R does the computation.
#   - x axis must have numeric values. Otherwise you see errors like this:
#       > hist(cr$Origin)
#       Error in hist.default(cr$Origin) : 'x' must be numeric
#     To get numeric values, compute the contingency table.
#
#   - ** figure out sensible bin counts (or use R defaults) ** 
# ---------------------------------------------------------------

# ---- histograms and RPM data ----

# RPM for the Cars93 dataset (revs per minute at maximum horsepower).
xname="engine RPM"

# default bin algorithm is used in this plot:
rpms = cr$RPM
hist(rpms, 
     xlab="xname", 
     main=paste("histogram of",xname,"default binning"),
     col="grey")

# R has named algorithms you can specify to perform binning. Here, they come up with same answer!
par(mfrow=c(1,2))
hist(rpms, xlab=xname, main=paste("histogram of",xname, "\n breaks=Scott"), breaks="Scott", col="blue")
hist(rpms, xlab=xname, main=paste("histogram of",xname, "\n breaks=FD"), breaks="FD", col="green")
par(mfrow=c(1,1), pch=1)

# ----------- Playing with the binning: -------------

# (suggested) number of bins for the histogram. 
# The "breaks" parameter supplies a suggested number of bins for the histogram, in this case:
par(mfrow=c(2,4))
hist(rpms, xlab=xname, main=paste("histogram of",xname, ",\n breaks=1"), breaks=1, col="grey")
hist(rpms, xlab=xname, main=paste("histogram of",xname, ",\n breaks=2"), breaks=2, col="grey")
hist(rpms, xlab=xname, main=paste("histogram of",xname, ",\n breaks=5"), breaks=5, col="grey")
hist(rpms, xlab=xname, main=paste("histogram of",xname, ",\n breaks=10"), breaks=10, col="grey")
hist(rpms, xlab=xname, main=paste("histogram of",xname, ",\n breaks=20"), breaks=20, col="grey")
hist(rpms, xlab=xname, main=paste("histogram of",xname, ",\n breaks=50"), breaks=50, col="grey")
hist(rpms, xlab=xname, main=paste("histogram of",xname, ",\n breaks=75"), breaks=75, col="grey")
hist(rpms, xlab=xname, main=paste("histogram of",xname, ",\n breaks=100"), breaks=100, col="grey")
par(mfrow=c(1,1), pch=1)

# how do we decide what bin count was most useful?

# --------------  experiment with bin count: define a function: ----------------

# since it's boring to repeat the same line so many times, let's make a function do the work:

# accept a bin count for the breaks parameter
# plot a histogram of the Cars93$RPM variable, using the bin count specified
rpmHist <- function(bins) {
  hist(Cars93$RPM, 
       xlab=xname, 
       main=paste("histogram of",xname, "\n breaks=",bins), 
       col="blue",
       breaks=bins)
}

# create a vector of bin sizes to try:
binvec = c(1,2,5,10,20,50,75,100)

# make 2x4 = 8 plots on one page:
par(mfrow=c(2,4))

# Now call the function...
# now apply our function to 8 possible bin sizes; plot each histogram:
lapply(binvec,rpmHist)

# set plots per page back to default:
par(mfrow=c(1,1), pch=1)

# --------- a more general bin size experiment: ----------


# Vary the bin sizes for an assortment of different columns in the Cars93 dataset.

# for purposes of locating best breaks for the cols specified below...
doHist <- function(bins, colnum) {
  hist(cr[,colnum], 
       col="grey",
       xlab=colnames(cr)[colnum], 
       main=paste("histogram of",colnames(cr)[colnum], "\n breaks=",bins), 
       breaks=bins)
}

# this function calls the doHist function for each value of binvec
tryBins <- function(colnum) {
  par(mfrow=c(2,4))
  binvec = c(8,10,12,15,18,20,25,50)
  # apply the doHist() function to the binvec vector and the column parameter:
  lapply(binvec, doHist, colnum)
  par(mfrow=c(1,1), pch=1)
}

# The indices of some columns in Cars93:
hcols = c(12,13,19,20,22,25)

# Use lapply to call tryBins() on the hcols vector of columns:
lapply(hcols,tryBins)

# reset default plot settings: one plot per page, default point:
par(mfrow=c(1,1), pch=1)
