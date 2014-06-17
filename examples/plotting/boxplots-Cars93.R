# boxplots-Cars93.R
#
# Boxplots display basic descriptive statistics on subsets of a dataset.
# features: Q1, Mean, Q3, min, max, and outliers (as circles)
# To plot, specify the formula: the dataset, and the groups into which to split it.
#
# for info type:
# > ?boxplot

library(MASS)
cr = Cars93

# ------------ Basic boxplots, or box-and-whisker plots ------

# do manual transmission cars get better gas mileage in this dataset?
boxplot(formula=MPG.city~Man.trans.avail, # divide MPG.city data into groups by Man.trans
        data=cr, 
        xlab="Manual Transmission Available?", 
        ylab="MPG, city",
        col=c("red", "darkblue"))
title("Miles per Gallon with Transmission Type")

# Relationship between horsepower and number of cylinders?
colors=rainbow(length(levels(cr$Cylinders)))
boxplot(formula=Horsepower~Cylinders, # divide Horsepower data into groups by # Cylinders
        data=cr,  
        xlab="# Cylinders", 
        ylab="Horsepower",
        col=colors)
title("Vehicle Horsepower with Number of Cylinders")

# --------------  MPG city and highway: as a box plot --------------

# Note that MPG is a numeric value, but still, we are doing some statistics on it!
# hence we get a boxplot. 

par(mfrow=c(1,2)) # place two plots on a "page"
xl = "MPG.city"
yl="MPG.highway"
colors=rainbow(length(levels(factor(cr$MPG.city))))
boxplot(formula=MPG.highway~MPG.city, 
        data=cr, 
        xlab=xl, 
        ylab=yl,
        col=colors)
title("MPG city and highway")

# same MPG data as above as a scatterplot. Which is more informative, scatter or box?
xl = "MPG.city"
yl="MPG.highway"
plot(formula=MPG.highway~MPG.city, 
     data=cr, 
     xlab=xl, 
     ylab=yl,
     pch=1)
title("MPG city and highway")
fit2=lm(cr$MPG.highway~cr$MPG.city)
abline(fit2)
par(mfrow=c(1,1)) # restore default: one plot per page

# wow, which cars do better than 40 MPG in the city?
#
# cr[cr$MPG.city>40,
#        c("Make","MPG.city","MPG.highway","Weight","Passengers")]
#
#Make MPG.city MPG.highway Weight Passengers
#39   Geo Metro       46          50   1695          4
#42 Honda Civic       42          46   2350          4

# ------------------------------------------

# --------- Vehicle Price by Type -------------

# boxplots of vehicle price by type. Ordering the categorical variables for clarity.

colors=rainbow(length(levels(cr$Type)))
par(mfrow=c(1,2)) # two plots on a "page"

# notice that the categorical variables are ordered alphabetically:
boxplot(formula=Price~Type, 
        data=cr, 
        cex.axis=0.6,
        las=2,        
        xlab='Vehicle Type', 
        ylab='Average Price in Thousands of Dollars')
title("Vehicle price by type, first try")

# using a reorder() call, we can order the vehicle types by price instead of alphabetical order:
type=reorder(cr$Type,cr$Price)
colors=rainbow(length(levels(cr$Type)))
boxplot(formula=Price~type, 
        data=cr, 
        cex.axis=0.6,
        las=2,        
        xlab='Vehicle Type', 
        ylab='Average Price in Thousands of Dollars',
        col=colors)
title("Vehicle type by price")
par(mfrow=c(1,1)) # restore default: one plot per page


# --- Price with Manufacturer ----
#
# appearance tips:
#     reorder the categorical x value by the y value.
#
#     rotate the x axis label 90 degrees; use las
#         The las setting sets the axis label style with respect to the axis: 
#         0=parallel, 1=all horizontal, 2=all perpendicular to axis, 3=all vertical
#
#     scale the axis labels by 60% of default text size; use cex.axis
#
# here's our first try:
#   notice that:
#       hard to interpret the graph
#       some x axis labels are missing: what's the one with the huge quartile extent?
#       
xl = "Auto Manufacturer"
boxplot(formula=Price~Manufacturer, 
        data=cr, 
        xlab=xl, 
        ylab="Average Price in Thousands of Dollars")
title("Vehicle Price with Manufacturer: first try")

# make some changes to improve the information conveyed by these plots:
#   - reorder the category "Manufacturer" (x axis) by the y axis quantity
#   - scale and rotate x axis labels
#   - colors for the boxes

# color boxes by Manufacturer
colors=rainbow(length(levels(cr$Manufacturer)))

# Vehicle Price by Manufacturer
mp=reorder(cr$Manufacturer,cr$Price)
xl = "Auto Manufacturer"
boxplot(formula=Price~mp, 
        data=cr, 
        xlab=xl, 
        ylab="Average Price in Thousands of Dollars", 
        cex.axis=0.6,
        las=2,
        col=colors)
title("Vehicle Price with Manufacturer")

# ---------- box plots with auto type ---------------

# what are our auto types?
levels(cr$Type)
# [1] "Compact" "Large"   "Midsize" "Small"   "Sporty"  "Van"  

table(cr$Type)
# Compact   Large Midsize   Small  Sporty     Van 
#      16      11      22      21      14       9 

# -------- Vehicle wheelbase with type --------

xl="Vehicle Type"
tw=reorder(cr$Type,cr$Wheelbase) # order type category by wheelbase
colors=rainbow(length(levels(cr$Type)))
boxplot(formula=Wheelbase~tw, 
        data=cr, 
        xlab=xl, 
        ylab="Wheelbase in Inches",
        col=colors)
title(paste("Wheelbase with",xl))

# --------------- Looking into Wheelbase ------------------

# Vehicle Wheelbase by Manufacturer
colors=rainbow(length(levels(cr$Manufacturer)))

mw=reorder(cr$Manufacturer,cr$Wheelbase)
boxplot(formula=Wheelbase~mw, 
        data=cr, 
        xlab=xl, 
        ylab="Wheelbase in Inches",
        cex.axis=0.6,
        las=2,
        col=colors)
title("Vehicle Wheelbase with Manufacturer")
par(mfrow=c(1,1))

# ------------------- Extra explorations... --------------
# # Question: what's the story with some of these wheelbases? 
# # Ford, for instance, has a huge range. Let's look:
#
# ford=cr[cr$Manufacturer=="Ford",]
# summary(ford$Wheelbase)
# # Ford wheelbases really do range from 90 to 114 inches!
# # 
# # # calling factor() enables us to strip unused levels from Make and Type variables
# # # refer here, use the factor() call to lose extra levels.
# # # http://www.r-bloggers.com/drop-unused-factor-levels/
# ford <- data.frame(factor(ford$Make), 
#                   factor(ford$Type), 
#                   factor(ford$Model),
#                   ford$Wheelbase) 
# summary(ford)
# #     factor.ford.Make. factor.ford.Type. ford.Wheelbase ...
# # 1        Ford Festiva             Small             90
# # 2         Ford Escort             Small             98
# # 3          Ford Tempo           Compact            100
# # 4        Ford Mustang            Sporty            101
# # 5          Ford Probe            Sporty            103
# # 6       Ford Aerostar               Van            119
# # 7         Ford Taurus           Midsize            106
# # 8 Ford Crown_Victoria             Large            114
# 
# # here's another way to do the same subsetting operation, with better control of column names:
# # # refer here, use the factor() call to lose extra levels.
# # # http://www.r-bloggers.com/drop-unused-factor-levels/
# model=factor(cr[cr$Manufacturer=="Ford","Model"])   # was a factor
# type=factor(cr[cr$Manufacturer=="Ford","Type"])   # was a factor
# wheelbase=cr[cr$Manufacturer=="Ford","Wheelbase"] # was an int
# 
# # here we could make a data frame containing whatever we want:
# # ford = data.frame(model, type, wheelbase)
# 
# # here's a Ford Wheelbase boxplot with Type:
# par(mfrow=c(1,2))
# 
# colors=rainbow(length(levels(type)))
# mw=reorder(type,wheelbase)
# boxplot(formula=wheelbase~mw, 
#         data=cr, 
#         xlab=xl, 
#         ylab="Wheelbase in Inches",
#         col=colors)
# title("Ford Vehicle Wheelbase with Type")
# 
# # with Model, it's still essentially a boxplot, since x is categorical:
# mw=reorder(model,wheelbase)
# plot(formula=wheelbase~mw, 
#         data=cr, 
#         xlab="Ford Model", 
#         cex.axis=0.8,
#         las=2,     
#         ylab="Wheelbase in Inches",
#         pch=1) # pch gets ignored
# title("Ford Vehicle Wheelbase with Model")
# par(mfrow=c(1,1))

# -------- Extra stuff: Violin Plot ----------

# A violin plot is a combination of a box plot and a kernel density plot. 
# Specifically, it starts with a box plot. It then adds a rotated kernel 
# density plot to each side of the box plot.

# Here is a violin plot of Weight and Type.
# library(vioplot)
# x1 <- cr$Weight[cr$Type=="Small"]
# x2 <- cr$Weight[cr$Type=="Sporty"]
# x3 <- cr$Weight[cr$Type=="Compact"]
# x4 <- cr$Weight[cr$Type=="Midsize"]
# x5 <- cr$Weight[cr$Type=="Large"]
# x6 <- cr$Weight[cr$Type=="Van"]
# vioplot(x1,  x2,  x3, x4, x5, x6, names=levels(cr$Type),
#         col="blue")
# title("Violin Plots: Vehicle MPG City and Highway")
# detach("package:vioplot", unload=TRUE)







