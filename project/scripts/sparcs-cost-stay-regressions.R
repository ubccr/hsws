# Regression project: SPARCS 2011 numeric data
# Cost and length of stay: scatterplot and linear regression
# -------------------------------------------------------------------

# make a scatterplot of all data in the dataset: total_costs (y axis) vs. length_of_stay
# (x axis). Determine the correlation of these two variables (use cor() function). 

# Comment. Is a line a good fit for this data? Is the correlation strong? Why or why not?
# Note: do not perform a linear regression for this plot.

# ------------------------------

# scatterplot and linear regression on subsets

# Let's try subsetting the data by county to see if we get a better regression.

# Make subsets of all Erie County and New York County data. You can use the which()
# function to determine the indices that fit the constraints you want. Now make
# scatterplots of these, and overplot with linear regressions. 

# linear regression

# To perform a linear regression, 
# use the function lm(), which takes arguments just like the scatterplot does.
# Overplot this on the scatterplot using the abline() function.

# residuals

# Use the following to plot the residuals to your fit (the output of the lm() call). Look up 
# what is meant by these figures:

# Diagnostic plots provide checks for heteroscedasticity, normality, and 
# influential observerations. 
# assuming the output of the lm() command is called fit, show summary and plot of fit:
summary(fit)

layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page
plot(fit)  
par(mfrow=c(1,1), pch=1) 

# correlation coefficient

# Find the correlations for the data in these subset scatterplots. How do you feel about this fit? Why?

# -------------------------------

# Now let's try subsetting the data further. Look at a particular disease and severity.
# subset to Erie county, Circulatory System disease, with Extreme severity and Extreme 
# risk of mortality. Use droplevels() to tidy up the resulting dataframe. 
# Look at the summary stats and the dimensions to understand the subset.


# make a scatterplot of all data in the subset: total_costs (y axis) vs. length_of_stay
# (x axis). Determine the correlation of these two variables (use cor() function). Determine
# and plot a linear regression for these two variables. Determine and plot the residuals for 
# this linear regression.

# Comment on the result. Is it a good fit? Is the correlation strong? Why or why not?

# -------------------         

# For residuals refer, for example, here:            
# http://www.statmethods.net/stats/regression.html
# Diagnostic plots provide checks for heteroscedasticity, normality, and 
# influential observerations. 
                  
# --                  
                  
# What are the distributions of diagnoses in this subset? Illustrate this with a 
# barplot or other plot on ccs_diagnosis. Do the same with apr_drg. Use labels and
# ordering to make your plot clear.
# What are the most common diagnoses and conditions in this dataset?
                  
# Make a plot showing the gender distribution in this subset of hospitalizations,
# and another plot showing the gender distribution in the overall Erie County subset.

# make a plot showing the age distribution in this subset.
# and another plot showing the age distribution in the overall Erie County subset.

# can you conclude that a given gender and age group is more heavily represented
# in this population of hospitalizations? Comment.

# ---------------

# Make a histogram on length of stay for this data subset, and also one on 
# total costs. Fiddle with bin size, find the best binning to display this data,
# and comment. Refer to the examples of histogram binning.

# Try making density plots for the same values. Which do you like better for these data?

# ----------------------------


# Some definitions about circulatory system diseases. These diseases include:
# 	Coronary artery disease.
# 	Atherosclerosis, arteriosclerosis, and arteriolosclerosis.
# 	Stroke.
# 	Hypertension.
# 	Heart failure.
# 	Aortic dissection and aneurysm.

# Also, refer here:

# https://www.dmu.edu/medterms/circulatory-system/circulatory-system-diseases/
# https://www.khanacademy.org/science/health-and-medicine/circulatory-system-diseases

# ----------

# Now let's make subsets for the same APR MDC, risk of mortality, and severity of 
# illness, but for different counties. Try New York and Albany county. Overlay the 
# scatterplot for each county with a computed linear regression. Use colors and a legend to 
# label and clarify your plot. Determine the correlations for each regression, and plot 
# the residuals. 

# Note that cost varies a lot by county. Read this and think about why that might be true:
# https://health.data.ny.gov/api/assets/A4E24A08-E42A-4DC5-ACAE-F98AB15B0A05?download=true
# Why do you think different counties have different costs?

# ----------

# We can overlay these 3 regressions (county, circulatory system, extreme risk and illness)
# on the same plot in order to better see the comparison between the 3.

# Display the different data and regression lines with different colors and symbols in order
# to make them easy to see. Refer to your plotting examples! 

# Do the figures you see here make sense to you? Can you rationalize why the cost data 
# appear this way for the counties you have plotted?


#-------------------------------------------------------------------

# For Erie county data, make a subset of admissions for which:
#
# county is Erie
# type_of_admission is Emergency
# severity_of_illness is Extreme
# risk_of_mortality is Extreme

# Again plot total costs by length of stay. Fit the plot and find
# the correlation coefficient.

#-------------------------------------------------------------

# Now do the same for Erie county, elective admissions, minor severity,
# and minor risk of mortality. find the correlation coefficients and
# fit the scatter plots.


# Compare what you have seen in this data subset. Does it make sense?
# Do you expect costs to be very different in these two populations?

