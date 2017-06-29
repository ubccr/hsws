# For this project, you will be using simple linear regression to predict the
# capacities of different battery compounds. 

#######################  Materials Science Background  #######################
# In this project, the two properties you will be concerned with are 
# specific heat and battery capacity.
#
# Specific heat is the ratio of the amount of heat added to an object to the 
# temperature change of that object per unit mass.
# Say you have two objects with the same mass, but one has a specific heat of
# 1 J/(kg*K) and the other has a specific heat of 5 J/(kg*K).
# The object with a specific heat of 5 J/(kg*K) will then require five times 
# as much heat added to undergo the same change in temeprature.
#
# Battery capacity is the available current and lifetime of a battery, for a 
# specific discharge rate and time.
# For example, a battery with a capacity of 1 amp-hour can supply 1 amp of 
# current for one hour, or two amps for half an hour, and so on, before being
# completely drained.
##############################################################################

# First, load elemental-data.csv and battery-data.csv into data frames.

###  Part 1: Exploring the Data  ###

# Write a function that, given a particular element A, returns the specific
# heats of the corresponding B elements in the compound. A and B are in the 
# battery data set. Specific heats are in the elemental data.

# Use the function to add specific heat data to the battery data frame.


# Given what you know about the important properties for this project, what
# will be the independent variable, and what will be the dependent
# variable? Why? Look at the data frames and convince yourself.
#
# To get a feel for the data, first make a plot of the relationship
# between the specific heat of components A, and the capacity. Calculate the 
# correlation and add a best fit line to the plot. 
# You can use the abline() function to plot straight lines, and the lm() 
# function to get the best fit. The input of the lm() function is lm(y ~ x).
#
# lm() uses linear least-squares regression to calculate the best fit line.
# You can read more about least-squares regression at 
# http://www.stat.yale.edu/Courses/1997-98/101/linreg.htm


# Now, generalize the plotting you have just done. Write a function that, given 
# x, y, and any additional parameters such as titles, plots the data and a best 
# fit line.
# Additionally, have the function print the R-squared value and the 
# root-mean-square-error. The R-squared value and residuals can be found
# using the summary() function on the output of lm(). The values can be 
# accessed similar to values in a data frame. To find the root-mean-square-error, 
# use the formula RMSE = sqrt(mean((residuals^2))).


# Take subsets of the battery data frame for each A element and use your 
# function to make plots and best-fit lines.
# Which sets of data look promising for linear regression?


###  Part 3: Linear Regression, Extrapolation, and Error   ###

# As previously mentioned, the linear regression provides a best-fit line.
# Data can be extrapolated from the fit to predict unknown values.
# A brief description of extrapolation, as well as its associated uses and issues, 
# can be found at
# http://www.statisticshowto.com/extrapolation/
#
# You've seen that there is a reasonably strong relationship between an element's
# specific heat and battery capacity. Since specific heat is tabulated for many
# elements, we can use it to predict battery capacities for untested compounds.
#
# Recall the equation for the best-fit line discussed above, y = a + bx. To do
# the extrapolation, we are solving for a y value (capacity) from a known
# x (specific heat), intercept, and slope. 


# Write a function that performs the linear regression and extrapolates the 
# capacity. 
# The function should take specific heat and capacity data for
# the compounds being fit, and the specific heat of the element whose 
# capacity is being predicted. 
# The function should return the predicted capacity.
# 
# Values for the intercept and slope can be found by using the 
# coefficients() function on the output of the lm() function.
# The intercept and slope are values [1] and [2], respectively.

# These predictions will not be perfect. As you saw when plotting the best-fit
# lines, the data points did not all fall perfectly on the line.
# 
# The percentage error can tell you how far a predicted value is from a 
# known correct value. The formula for percentage error, and an example, can
# be found at
# http://astro.physics.uiowa.edu/ITU/glossary/percent-error-formula/
#
# We can find this percentage error to get a sense of how accurate a prediction
# actually is, without having to use more sophisticated statistical techniques.

# Write a function that accepts predicted and known values as inputs, and 
# returns the calculated percent error.


###  Part 4: Predictions  ###

# Use your linear regression and error functions to predict the capacities
# of some known A and B combinations, such as magnesium with titanium.
#
# Then, predict the properties of some new batteries made from A and B 
# combinations that aren't in your dataset.
# 
# How accurate do you think these answers are? Justify your answers
# based on the error data you calculate.


# Plot your predicted battery data pairings with known data, giving them
# different colors or symbols so they can be distinguished from the 
# experimental data. Hint: use points() with col() to add to your 
# existing plot.
#
# For what B elements do you feel your predictions are reasonable?
# Will this linear relationship hold for any element you might select?
# Why or why not? You may want to do some reading to explore this further.


### Part 5: Some Reading ###

# Here's some reading about batteries and materials to provide some context:

# New ideas:
#	http://www.pocket-lint.com/news/130380-future-batteries-coming-soon-charge-in-seconds-last-months-and-power-over-the-air
#	https://www.technologyreview.com/s/534866/why-we-dont-have-battery-breakthroughs/

# Some visuals:
#	http://www.visualcapitalist.com/evolution-of-battery-technology/

# A classical view of batteries:
#	http://batteryuniversity.com/learn/archive/whats_the_best_battery

