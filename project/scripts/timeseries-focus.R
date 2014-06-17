# Timeseries Focus
# HWI protein crystallization data
# Summer 2013

# This project focus will highlight the timeseries nature of the data, which is to say, the variability
# between the two timepoints for which we have experiments for each protein and set of chemical cocktails.

# first, load the dataset: sample and experiment 

# load the factorify function:
source("./project/scripts/generalFactorifyFunction.R")

# -------- total experiments with successful crystallizations: pie chart -------------------

# Generate a pie chart that shows the number of experiments with successful crystallizations,
# and the number of experiments that did not crystallize. The total should add to 100% and
# represent the entire dataset. Label your plot sensibly, with percentages, and provide a title.


# ----------- overall crystallization by week number --------------

# Generate a bar chart that shows the number of experiments with successful crystallizations,
# and the number of experiments that did not crystallize, broken down by week. You can make 
# several choices to display this plot; decide which you think conveys the most information.
# 
# For instance:
# You might try placing the bars beside one another, and making the y axis display a log scale. 
# Can you print the counts by each bar to make it even more clear (TODO JMS)

# -------------- Successful crystallizations, by protein and week ---------------------

# How many successful crystallizations were accomplished across the dataset? Subset the experiment
# data frame by successful crystallizations to provide a data frame consisting only of crystallized
# examples. Factorify this data frame and merge it with the sample data frame to provide access to 
# the protein information.

# perform merge on sample_id to get p_number (protein number) for the labels:
cr8=experiment[experiment$human_crystal==1,]
cr8=factorify(cr8)
cr8 = merge(sample, cr8) # merge on sample_id to get sample (protein) info

# Summary statistics: crystallizations, by protein, by week
# For the successful crystallizations: display the summary of descriptive statistics by week and protein. 
# 
# First, determine the counts of successful crystallizations broken down by week number and protein number.

# Use this to find the statistical summary of crystallization counts by week

# ------------- box plot of successful crystallizations, by week. -------

#  You have already calculated the counts of successful crystallizations broken down by week number and 
# protein number. Use this value to create a box plot showing the summary statistics for crystallizations, 
# by week.
#
# The box plot should agree with the summary statistics you computed above. But, R needs to be
# told which dimension of your table to perform statistics along. This is why
# the boxplot formula has the form y ~ grp, where y is a numeric vector of data values to be 
# split into groups according to the grouping variable grp. So, we split the table by its rownames,
# (or colnames) which label the weeks of the experiment.
#
# Label the axes and provide a title.


# -------------- bar plot of crystallizations by protein and week ------------------

# You have already calculated the counts of successful crystallizations broken down by week number and 
# protein number. Use this value to create a bar plot of the proteins, broken down by week number.
# Label by week number and by protein number (p_number) and provide a title.
# 
# Refer here to adjust your x/y axis label sizes:
# http://stackoverflow.com/questions/3778084/r-how-to-adjust-only-size-of-y-axis-labels


# ---------------------- Analysis ----------------------

# Is one of the two time periods (weeks) more successful than the other for crystallizations? For which 
# proteins? Are there relationships between the relevant proteins? Why this might be so?
#
# Consider exploring the seq_len and experimental_molecular_weight for proteins with similar
# crystallization behaviors. Are there relationships?



