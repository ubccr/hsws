# You have been asked to decide on a new alloy with which to design the body of
# a car. 
# You will be investigating the properties that make a safe, practical design
# and using these to select a material.

#######################  Materials Science Background  ########################
# Two important concepts for your design are strength and toughness.

# Strength is a measurement of how much a material deforms when a force is 
# applied to it. 
# The strength considered in the data sets is called the "bulk modulus", which 
# is a measure of compressibility. 
# The bulk modulus determines how much of a decrease in size a material 
# undergoes when a given pressure is applied to it.
# A high bulk modulus or high strength means that a material requires a large 
# amount of applied pressure before it deforms.

# Toughness is a measurement of how much energy a material can absorb before 
# fracturing. 
# Brittle materials such as glass or ceramic have low toughnesses, meaning that
# they are relatively easy to crack or shatter. 
# A material with a high toughness can undergo more of an impact without 
# breaking.
###############################################################################

# Load elemental-data.csv and tialx-properties.csv into data frames.

# Merge the data frames into a single data frame.
# Set all=TRUE to keep every value.

# Add a column to the data frame containing the element toughness. 
# You can calculate toughness by:
# Toughness = Bulk Modulus/Shear Modulus


### Part 1: Predicting Properties  ###

# Write a function that predicts the property of an alloy based on the weighted
# sum of the element properties.
# The alloy is 50% Ti-45% Al-5% X, for a varierty of added elements X. 

# Use this function to predict the strength and toughness of the alloys.
# Construct a data frame containing the predicted and actual values.

# Use this data frame to make plots comparing both sets of estimated and actual
# property values.

# What do these plots indicate about alloy performance? Is it better or worse 
# than that of pure elements?

# Remove the non-alloy data from your merged data frame.

### Part 2: Design  ###
# What properties go into the design of your car? Think about what you would 
# look for when buying a car. 
# Safety ratings, gas mileage, and cost are often considered by consumers.
# Are there factors beyond what was listed that you would consider?

# How do those translate to the data you have available?
# For example, consider what happens in a car accident. 
# Do you want a car that crumples under impact, or that is relatively unharmed 
# by a collision?
# Determine if you want to minimize, maximize, or take an intermediate value
# of each property you're interested in.

# Also consider the relative importance of each property. 
# For instance, how much does cost matter compared to safety?
# Often you find that there's a trade-off between desirable properties. 
# You can decide which properties are very important and which are flexible, 
# and use that to determine what material to use. 

# Make histograms of the properties you're interested in to get a sense of 
# the ranges of values.
# Then make plots comparing the different properties.
# Decide on cut-off points for each of these values, and use these values to 
# narrow down the possiblities considered in subsequent plots.
# You can use the abline() command to indicate the cut-off points on the plot,
# and the text() command to label points.

# You can also use the intersect() command to take subsets of the data frame
# under certain limits, instead of comparing points graphically.

# You have some freedom in deciding what properties to compare. 
# The goal is to find an optimal alloy to use based on the properties that you 
# determined earlier. 
# There is no objectively correct answer - you just want to find a material 
# meets the requirements  you specified, and be able to justify your decision.
# This does mean, however, that you should be satisfied of your previous 
# decisions and understand why you made them.


# What are the best one or two additional elements to use in the alloy? 
# Explain how you made your choice, using the plots and data you generated.
# Also explain what elements you excluded and why.