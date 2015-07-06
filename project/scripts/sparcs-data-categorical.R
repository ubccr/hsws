# PROJECT: Categorical data in the sparcs 2011 dataset

#Plotting categorical data
#-------------------------

# Find at least two ways to plot the number of admissions in each category below.
# Which plot do you feel is most clear? Use the plot examples to label and title the plots
# and add additional information such as calculating percentages. What can you conclude
# about the dataset, from these plots?
#
# Are there NAs in these categories? How can you find out? What happens when you try to plot them?
#
#   type of admission
#   apr severity of illness
#   medical surgical
#   apr_risk_of_mortality


# -------------------------------------------------------------------

# Boxplots by categorical variables
# ----------------------------------

# let's look at boxplots of costs with these different
# categorical variables. Use the boxplot "formula" input
# to divide up the dataset by the above categorical
# types. Each will make a single plot.
# Refer to your plot examples for syntax and labeling.

# Remember that boxplots provide a visual representation
# of the quartiles, median, min and max for your dataset.
# These plots will help us visualize these characteristics
# of different groupings of the hospital stay data.

# Try one of these cost boxplots first (say, medical_surgical).
# What do you notice about the boxplot? Can you identify
# the quartile values and median from the boxplot?
# If not, why not? What features of the data are
# contributing to the problem?



# Take a look at the data summary of the cost, and a
# boxplot of cost alone. Compare the median to the mean.
# What is happening here?

# Let's try to discard outliers from the cost data so
# that we can see a sensible result.
# Here are two ways to discard outliers: We can choose
# to keep only data that is within 3 standard deviations
# of the mean; or, we can keep only data that falls
# within certain parameters of the interquartile range.

# Make a subset of the main dataset that excludes data
# that is more than 3 standard deviations beyond the mean.
# Then try the boxplots again.

# Alternately, try truncating the y axis in the plot to
# show only the data to 3 standard deviations. Use the
# argument ylim=c(lowlim, highlim) in the plot() call.
# Set lowlim and highlim equal to the numbers you want for
# your limits. Do you prefer this approach? Compare the
# statistics summary between the two and decide.

# Do you feel comfortable with discarding this number
# of records? Look at it by percent and decide, then
# defend your decision.

# do you feel justified in truncating the cost data as you did?
# Why or why not? Hint: look at the inter-quartile range. Read
# about interquartile ranges and outliers, and construct an
# argument for or against this choice.

#https://en.wikipedia.org/wiki/Interquartile_range
#http://mathworld.wolfram.com/Outlier.html

# Is there another way you'd prefer to truncate the data by
# cost? If so, try it and compare to this method. Defend your choice.

# What conclusions can you draw from your boxplots? Can you use the
# statistics to distinguish between different types of admissions, etc.?

# Think of another quantity that would be interesting to plot this way, 
# and try it.

# -------------------------------------------------------------------

# Varying categorical data together
# ---------------------------------

# Let's represent how two categorical data columns vary together. Create a 
# contingency table and plot:
#   type of admission with apr_severity_of_illness
#   apr_risk_of_mortality with apr_severity_of_illness
#
# Use the plot examples to clearly label the categories and provide a title.
# Don't forget to label your axes clearly!
#
# Tip: Use reorder() to order your categorical data by median length
# of stay or another numeric variable, such as total_costs. Be sure to indicate
# this ordering in your labels. 
#
# Include a legend with the legend() function; try adding a grid with grid().


# Some columns have many possible values. What is the best way to plot these?
# Try plotting some in different ways. Examples: hospital county, facility_name,
# apr_drg, ccs_diagnosis, ccs_procedure. Is it best to combine these with
# other information in order to understand and visualize these column contents?
# What plot methods should be avoided with these categories?


# -------------------------------------------------------------------

# Now let's make some larger barplots that combine categorical data
# and perform sorts, to show more information. 

# Plot a barplot showing all Patient Dispositions, separated by Age group.
# First, sort the Patient Dispositions by the median length of stay.
# What does Patient Disposition mean? Look at the levels to decide.
# What is interesting about this plot?



# Do the same for type of admission, separated by severity of illness.
# First, sort the data by length of stay. What can you conclude? 
#type of admission sorted by length of stay vs severity of illness 
# ANS


# Finally, pick an apr_mdc category that interest you (example: Respiratory Disease)
# Construct a barplot of hospital admissions for this category, with a bar for
# each County's admissions. Divide the counties by a categorical variable such
# as Sex, Patient Disposition, or Source of Payment. Try several. Do you see
# something interesting you can conclude from your plot?

# ----------------------------------------------------------------------------

# SOURCE OF PAYMENT

# What does this column of data mean? Why is it interesting/important?

# How many admissions in each payer type? 
# Can you think of a way to visualize this in a graphic? Try it.

# Do the payer types make sense?
# Simplify these categories into four major groups:
#
#  Group Name                        Payment Codes Included
#
#	Private Insurance (“Private”)   	  F G
#	Government Insurance (“Public”)     C D E H 
#	Self-Pay (“Self”)             	  	A
#	Other Payer (“Other”)             	B I

# Where:
# 
# 	Insurance type:
# 
# 	The possible payment codes are as follows:
# 	"A"=Self - Pay
# 	"B"=Workers' Compensation
# 	"C"=Medicare
# 	"D"=Medicaid
# 	"E"=Other Federal Program
# 	"F"=Insurance Company
# 	"G"=Blue Cross
# 	"H"=CHAMPUS
# 	"I"=Other Non - Federal Program


# try as barplot as well as pie chart. Which do you prefer?

# --------------------------------------------------------------

