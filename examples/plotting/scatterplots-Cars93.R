# scatterplots-Cars93.R
#
# A scatterplot has numeric values on both axes.
# Create a scatterplot to investigate relationships between
# numeric variables in your dataset.

library(MASS)
cr = Cars93

# ------- Vehicle weight and highway MPG -------

# Note that R labels the axes from the column names:

# MPG.highway~weight is: MPG.highway vs. weight
plot(formula=MPG.highway~Weight, 
     data=cr)

# Compute a linear model:
fit=lm(cr$MPG.highway~cr$Weight)
# Overlay it on the plot:
abline(fit)
# Add a title
title("MPG highway with Vehicle Weight")

# ------- Vehicle weight and MPG: city and highway -------

# Two plots, side by side: mfrow: 1 row, 2 columns
par(mfrow=c(1,2))

yli=c(15,50) # enforce same y limits for both plots

# labels for x and y
yl = "MPG.city"
xl = "Vehicle Weight/lbs."

plot(formula=MPG.city~Weight, 
     data=cr, 
     xlab=xl, 
     ylab=yl,
     ylim=yli,
     pch=1)
fit=lm(cr$MPG.city~cr$Weight) 
abline(fit)
title("MPG city with Vehicle Weight")

yl="MPG.highway"
plot(formula=MPG.highway~Weight, 
     data=cr, 
     xlab=xl, 
     ylab=yl,
     ylim=yli,
     pch=3)
fit=lm(cr$MPG.highway~cr$Weight)
abline(fit)
title("MPG highway with Vehicle Weight")

par(mfrow=c(1,1), pch=1) # change back to default layout: 1 plot alone

# --------- Overplotting on a single plot, using points() ----------

# weight and MPG 
# Color the points with "col", and give them a point type with "pch":

# labels for x and y axes:
yl = "MPG"
xl = "Vehicle Weight/lbs."

# plot MPG.city vs. Weight, in blue. 
# pch indicates point type:
plot(formula=MPG.city~Weight, 
     data=cr, 
     xlab=xl, 
     ylab=yl, 
     col="blue", # change color of points
     pch=1,      # specify point type
     ylim=yli)

# compute and draw linear fit forMPG.city vs. Weight:
fit=lm(cr$MPG.city~cr$Weight) 
abline(fit, col="blue")
title("MPG with Vehicle Weight")

# overplot MPG.highway vs. Weight, in purple. 
# pch indicates point type:
points(cr$Weight, 
       cr$MPG.highway, 
       col="purple", # change color of points
       pch=3,        # specify point type
       ylim=yli)

# compute and draw linear fit for MPG.highway vs. Weight:
fit2=lm(cr$MPG.highway~cr$Weight)
abline(fit2,col="purple")

# legend shows points and colors for each data type:
legend(x="topright",               
       title="MPG",         
       legend=c("Highway","City"), 
       pch=c(3,1),
       col=c("purple","blue"))          
par(mfrow=c(1,1), pch=1) # default plot appearance

# # ------------------ Wheelbase vs. Length scatter plot ------------------
# 
# # scatter plots. Note that R labels the axes for you here:
# 
# # Wheelbase vs. Length, with regression line:
# plot(Wheelbase~Length, data=cr)
# title("Vehicle Wheelbase (in) by Length (in)")
# 
# # create and draw regression line:
# fit2=lm(cr$Wheelbase~cr$Length)
# abline(fit2,col="purple")

# # ------------------ Wheelbase vs. Length Residuals ------------------
# 
# # Let's look at the residuals, the difference between the fitted
# # values (expected by the linear model) and the real values.
# resid=resid(fit2)
# plot(cr$Length, resid,
#      ylab="Residuals",
#      xlab="Vehicle Length",
#      main="Residuals: Vehicle Wheelbase with Length")
# abline(0,0) # the horizon line
