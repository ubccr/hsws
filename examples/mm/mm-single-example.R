# plotting M&M color frequencies arising from a single sample (package)
# =====================================================================

# clear the workspace
rm(list=ls())

# EDIT HERE: suppose we had a single package of mms with the following counts:
# of the following colors:
# this will double as both labels and as colors for the bars:
mvl=c("red", "blue", "green", "yellow", "orange", "brown");
mv =c(   4,      5,       3,        2,        1,       3)

# associate the color names with the color counts
names(mv) = mvl

# EDIT HERE: change to your group's name 
ptitle = "M&Ms in example package";

# use barplot() for categorical data, and label the axes:
barplot(mv,                # data to plot
        xlab="M&M color",  # label for x axis
        ylab="count",      # label for y axis
        main=ptitle,       # title for plot
        col=mvl)           # vector of colors for the plot bars

# -----------------

# what else can we learn about this package of M&Ms?

# represent in chart form the frequencies
mtable = table(mvl, mv)
print("table of M&M counts in package")
print(mtable)

msummary = summary(mv)
print("Statistical summary of M&M package")
print(msummary)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 1.00    2.25    3.00    3.00    3.75    5.00 

msum = sum(mv)
print("Total number of M&Ms in package")
print(msum)
# [1] 18

mrange = range(mv)
print("Range of color counts, M&M package")
print(mrange)
# [1] 1 5