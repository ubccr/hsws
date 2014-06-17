# plot examples from statmethods.net
# using mtcars dataset
# 3 May 2013
# JMS


# pch controls point selection
# col controls point color
plot(mtcars$wt, mtcars$mpg, xlab="Vehicle Weight, lbs./1000",
     ylab="Vehicle MPG, miles/gallon",
     pch=8, col="darkblue")
abline(lm(mtcars$mpg~mtcars$wt), col="darkred")
title("Regression of Vehicle MPG on Weight")

# ------------------- Histograms ---------------------

# Histograms can be a poor method for determining the shape of a distribution 
# because it is so strongly affected by the number of bins used.

# Colored Histogram with Different Number of Bins
# Add a Normal Curve (Thanks to Peter Dalgaard)
# JMS finds this a little too mysterious. Why breaks==10? Why seq() with length=40?
# JMS changes breaks to 20 and finds the fit much more plausible/pleasing
x <- mtcars$mpg
h<-hist(x, breaks=20, col="red", xlab="Miles Per Gallon",
        main="Histogram of Vehicle MPG, with Normal Curve")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2) 
rm(x,h,xfit,yfit)

# ------------ Kernel density plots --------------

# Kernel density plots are usually a much more effective way to view the 
# distribution of a variable. Create the plot using plot(density(x)) 
# where x is a numeric vector.

# Kernel Density Plot
d <- density(mtcars$mpg) # returns the density data
plot(d) # plots the results 

# Comparing Groups via Kernel Density
# 
# The sm.density.compare( ) function in the sm package allows you to superimpose 
# the kernel density plots of two or more groups. The format is 
# sm.density.compare(x, factor) where x is a numeric vector and factor is the 
# grouping variable.

# Compare MPG distributions for cars with
# 4,6, or 8 cylinders
library(sm)

# create value labels
cyl.f <- factor(mtcars$cyl, levels= c(4,6,8),
                labels = c("4 cylinder", "6 cylinder", "8 cylinder"))

# plot densities
sm.density.compare(mtcars$mpg, mtcars$cyl, xlab="Miles Per Gallon")
title(main="MPG Distribution by Car Cylinders")

# add legend 
colfill<-c(2:(2+length(levels(cyl.f))))
legend(x="topright", levels(cyl.f), fill=colfill) # JMS: pin legend to top right
#detach("package:sm", unload=TRUE)
rm(cyl.f,colfill)

# --------------- Dotplot ---------------------

# Dotplot: Grouped, Sorted, and Colored
# Sort by mpg, group and color by cylinder
x <- mtcars[order(mtcars$mpg),] # sort by mpg
x$cyl <- factor(x$cyl) # it must be a factor
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,labels=row.names(x),
         cex=.7,
         pch=20,
         groups= x$cyl,
         main="Gas Mileage for Car Models\ngrouped by # Cylinders",
         xlab="Miles Per Gallon", 
         gcolor="black", 
         color=x$color) 
rm(x)

# ------------- Barplot --------------
# 
# Bar plots need not be based on counts or frequencies. You can create bar plots that 
# represent means, medians, standard deviations, etc. Use the aggregate( ) function 
# and pass the results to the barplot( ) function.
# 
# By default, the categorical axis line is suppressed. Include the option axis.lty=1 
# to draw it.
# 
# With many bars, bar labels may start to overlap. You can decrease the font size 
# using the cex.names = option. Values smaller than one will shrink the size of the label. 

histcols=c("red","blue","green")

# Simple Bar Plot
counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution with Number of Gears",
        xlab="Number of Gears",
        names.arg=c("3 Gears", "4 Gears", "5 Gears"),
        col=histcols) 


# Stacked Bar Plot with Colors and Legend

vslabel=c("V engine","Straight engine")
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and V or Straight",
        xlab="Number of Gears", 
        col=c("darkblue","red"),
        legend = vslabel) 

# ----  gears and carburetors ----

# how to put a title on your legend:
colors=c("purple","blue","green","yellow","orange","red")
counts <- table(mtcars$carb, mtcars$gear)
title="Car Distribution by Gears and Carburetors"
barplot(counts, main=title,
        xlab="# Gears", 
        ylab="Count",
        col=colors)
legend(x="topright", 
       title="# Carburetors", 
       rownames(counts),
       fill=colors)
rm(counts,colors)

# ------------ boxplots ----------------

# Boxplot of MPG by Car Gears
boxplot(mpg~gear,data=mtcars, main="Vehicle MPG with Number of Gears",
        xlab="Number of Gears", ylab="Miles Per Gallon",
        col=c("red","blue","green")) 

# ---- Violin Plot ----------

# A violin plot is a combination of a box plot and a kernel density plot. 
# Specifically, it starts with a box plot. It then adds a rotated kernel 
# density plot to each side of the box plot.

library(vioplot)
x1 <- mtcars$mpg[mtcars$gear==3]
x2 <- mtcars$mpg[mtcars$gear==4]
x3 <- mtcars$mpg[mtcars$gear==5]
vioplot(x1,  x2,  x3, names=c("3 gears", "4 gears", "5 gears"),
        col="blue")
title("Violin Plots: Vehicle MPG with Number of Gears")
detach("package:vioplot", unload=TRUE)
rm(list=ls())

# ------------ Pie charts ------------

# Pie Chart with Percentages: Gears data
slices <-table(mtcars$gear)
lbls <- levels(factor(mtcars$gear))
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, "Gears: ", pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # add % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Number of Gears in Auto Dataset") 

# Pie Chart with Percentages: Cylinders data
slices <-table(mtcars$cyl)
lbls <- levels(factor(mtcars$cyl))
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, "Cylinders:", pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # add % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Number of Cylinders in Auto Dataset") 

# Pie Chart with Percentages: Carburetor data
slices <-table(mtcars$carb)
lbls <- unique(mtcars$carb)
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, "Carburetors:", pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # add % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Number of Carburetors in Auto Dataset") 

# 3D Exploded Pie Chart: requires plotrix package.
library(plotrix)
lbls <- unique(mtcars$carb)
pie3D(slices,labels=lbls,explode=0.1,
      main="Number of Carburetors in Auto Dataset")
detach("package:plotrix", unload=TRUE) 
rm(slices,lbls,pct)

# Annotated pies from a data frame:
# Pie Chart from data frame Annotated with Sample Sizes
#mytable <- table(iris$Species)
#lbls <- paste(names(mytable), "\n", mytable, sep="")
#pie(mytable, labels = lbls,
#    main="Pie Chart of Species\n (with sample sizes)") 

# ------------ boxplots ----------------

# Boxplot of MPG by Car Cylinders
boxplot(mpg~cyl,data=mtcars, main="Vehicle MPG with Number of Cylinders",
        xlab="Number of Cylinders", ylab="Miles Per Gallon",
        col=c("red","blue","green")) 

# ---- Violin Plot ----------

# A violin plot is a combination of a box plot and a kernel density plot. 
# Specifically, it starts with a box plot. It then adds a rotated kernel 
# density plot to each side of the box plot.

library(vioplot)
x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
vioplot(x1,  x2,  x3, names=c("4 cylinder", "6 cylinder", "8 cylinder"),
        col="gold")
title("Violin Plots: Vehicle MPG with Number of Cylinders")
detach("package:vioplot", unload=TRUE)
rm(list=ls())


# ------------ Bagplot ---------------------

# Example of a Bagplot
library(aplpack)

bagplot(mtcars$wt,mtcars$mpg,
        xlab="Car Weight, lb/1000",
        ylab="Miles Per Gallon",
        main="Bagplot: Vehicle MPG with Weight") 
detach("package:aplpack", unload=TRUE) 


# ------------ Scatter plots ---------------------

# JMS: ok, but simplify. 
#   What is loess? 
#   scatterplot() is ~ugly
#   pairs() resulting plot is not intuitive
#   call to splom() errs out
#   load new libraries
#   check out sunflowerplot()

# Simple Scatterplot
plot(mtcars$wt, mtcars$mpg, main="Scatterplot: Vehicle MPG with Weight",
     xlab="Car Weight, lb./1000", ylab="Miles Per Gallon ", pch=20) 

# Add fit lines
abline(lm(mtcars$mpg~mtcars$wt), col="red") # regression line (y~x)
lines(lowess(mtcars$wt,mtcars$mpg), col="blue") # lowess line (x,y) # TODO: definition

# Enhanced Scatterplot of MPG vs. Weight
# by Number of Car Cylinders
# JMS feels this needs some annotation
library(car)
scatterplot(mpg ~ wt | cyl, 
            data=mtcars,
            xlab="Weight of Car", ylab="Miles Per Gallon",
            main="Enhanced Scatter Plot: Vehicle MPG with Weight",
            labels=row.names(mtcars)) 
detach("package:car", unload=TRUE)

# Scatterplot Matrices from the glus Package
library(gclus)
dta <- mtcars[c(1,3,5,6)] # get data
dta.r <- abs(cor(dta)) # get correlations
dta.col <- dmat.color(dta.r) # get colors
# reorder variables so those with highest correlation
# are closest to the diagonal
dta.o <- order.single(dta.r)
cpairs(dta, dta.o, panel.colors=dta.col, gap=.5,
       main="Vehicle Data Scatterplot Matrix: variables ordered and colored by correlation",
       pch=20) 
rm(dta, dta.col, dta.r, dta.o)
# detach("package:gclus", unload=TRUE) 


# High Density Scatterplot with Binning
library(hexbin)
x <- rnorm(1000)
y <- rnorm(1000)
bin<-hexbin(x, y, xbins=50)
plot(bin, main="Hexagonal Binning Example") 
rm(x,y,bin)
detach("package:hexbin", unload=TRUE) # throws error
       
# ------------- Mosaic plots ------------------------
       
 # Mosaic Plot Example
 library(vcd)
 mosaic(HairEyeColor, shade=TRUE, legend=TRUE,
        main="Hair and Eye Color Mosaic Plot")   
 detach("package:vcd", unload=TRUE)
 
 # Association Plot Example
 #library(vcd)
 #assoc(HairEyeColor, shade=TRUE) 

# ------------ Correlograms ---------------------
       
 # First Correlogram Example
 library(corrgram)
 corrgram(mtcars, order=TRUE, lower.panel=panel.shade,
          upper.panel=panel.pie, text.panel=panel.txt,
          main="Car Mileage Data in PC2/PC1 Order")    
 
 # Second Correlogram Example
 corrgram(mtcars, order=TRUE, lower.panel=panel.ellipse,
          upper.panel=panel.pts, text.panel=panel.txt,
          diag.panel=panel.minmax,
          main="Car Mileage Data in PC2/PC1 Order") 
 
 # Third Correlogram Example
 corrgram(mtcars, order=NULL, lower.panel=panel.shade,
          upper.panel=NULL, text.panel=panel.txt,
          main="Car Mileage Data (unsorted)")
       
# ------------- notched boxplots: has errors; fix --------------

# Notched Boxplot of Tooth Growth Against 2 Crossed Factors
# boxes colored for ease of interpretation
boxplot(len~supp*dose, data=ToothGrowth, notch=TRUE,
        col=(c("gold","darkgreen")),
        main="Notched Boxplot: Tooth Growth", 
        xlab="Supplement and Dose") 
