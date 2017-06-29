# We want to design new batteries suited to particular applications. 
# To do so, we need to understand what properties are related to capacity and 
# voltage, and what properties are necessary for a particular type of battery.
# From there, we can make "design rules" that help dictate what possible 
# compounds we can use.

# You will be looking at all possible correlations between the sets of 
# elements and compounds.

#######################  Materials Science Background  ########################
# Battery capacity is the available current and lifetime of a battery, 
# for a specific discharge rate and time.
# For example, a battery with a capacity of 1 amp-hour can supply 1 amp of 
# current for one hour, or two amps for half an hour, and so on, before it is
# completely drained.

# Voltage is the difference in electric potential energy.
# A fully charged battery will have a higher voltage than a discharged
# battery, similar to how a ball being held above the ground will have a higher
# potential energy than a ball resting on the floor.
###############################################################################

# Import battery-data.csv and elemental-data.csv into data frames.
# Remember to include headers.

### Part 1: Filtering Numerical Data  ###

# Write a function that takes a data frame as the input and returns a data 
# frame containing only the numerical values as the output.
# This will allow you to apply your correlation function to an entire data frame.

### Part 2: Finding Correlations  ###

# Choose two properties - one found in the elemental data set, and one found
# in the battery data. Try applying the correlation function to the properties.


# What happened? Explain why this didn't work and identify what issues exist
# with trying to correlate your battery data set to the elemental data set.

# Take a subset of your battery data set that only has data for compounds
# including a specific element of your choosing. 
# Repeat your previous step: using your subset of the data, apply the 
# correlation function to the battery property and elemental data.
# You may need to use the as.vector() function when searching the data frames.


# Make a plot of the data to confirm the result of the correlation.


# Was your correlation weak or strong? How was this supported by the plot?
# What do the results mean? That is to say, what are you correlating, and 
# what does the output tell you about that the elements and the compounds?
# There are several layers to what you are doing, so take a moment to 
# think about it and make sure you can explain it. 

# Find the dimensions of the elemental data frame. How many properties does
# it contain? How many of those can be compared with the elemental data?


# Clearly, there is too much data to go through and repeat the earlier process
# manually. (Incidentally, the elemental data set is still relatively small.) 
# Fortunately, you can use functions to generalize those steps and 
# do the filtering and correlating for you. 

# Write a function to find correlations between battery data and elemental
# properties, given the element A of a compound.

# The function should take an element symbol as the input.
# It should then find the elements used in conjunction with the given
# element, and find properties of the compounds (from the battery data)
# and the properties of the associated elements (from the elemental data).
# It should then apply the function you wrote previously to filter out 
# non-numerical data from both data frames.
# Finally, it should return a data frame that with the correlation coefficients
# between the battery data and elemental data. 


# Write a second function that takes element B in the compound as input and 
# subsets the data the same way as the first function.


# As before, take a moment to explain what it is you are correlating, and 
# what the correlation coefficients indicate.


###  Part 3: Finding Candidate Compounds   ###

# Batteries used for different applications will have different design 
# requirements. For example, a car battery shouldn't be too heavy, since the 
# weight will impact fuel efficiency. It also needs to be able to withstand 
# higher temperatures than, say, a watch battery would.

# In general, capacity is a property we wish to maximize, since we want 
# batteries that can go a long time without being recharged.

# Voltage depends more on the particular application of the battery.
# In general, the more power required, the higher the voltage should be.
# Returning to the previous example, the watch battery will have a lower voltage
# than the car battery, since it doesn't require as much energy to operate.

# Suppose you were designing a new pacemaker battery, using zinc and another
# currently undecided element. 
# What features are important for a pacemaker battery to have?
# Consider the not only the battery properties, but also the impact that the
# wearer's body will have on the battery and vice-versa.

# Search the battery data set for only zinc compounds, and the elemental
# data set for the other elements used with zinc.

# Decide on one property in the elemental data set that correlates well with
# battery capacity.
# Make plots comparing this property with battery capacity and voltage.

# What current battery compound would be best for use in a pacemaker?
# What issues might there be using these compound?
# What additional properties would you consider when making a pacemaker battery?

# Use the values obtained from the plots to get a sense of a reasonable cutoff 
# point for the elemental property you chose. 
# Use this and the other factors you decided on to narrow down the list of 
# possible elements to use with zinc. 


# How did you determine what values of the properties to use?
# What final elements do you think are worth testing?


# Next, suppose you are designing a battery for a backup generator using
# magnesium and another undecided element.

# Decide on one or more properties in the elemental data set that correlate
# well with battery capacity and/or voltage.
# Make plots comparing this property with battery capacity and voltage.

# What current battery compound would be best for use in a generator?
# What properties would you consider when making a generator battery?
# How are they different from the pacemaker battery?
# Once again, use the values obtained from the plots to get a sense of 
# reasonable cutoff points for the elemental property or properties you chose. 
# Use this and the other factors you decided on to narrow down the list of 
# possible elements to use with magnesium in the generator battery. 


# How did you determine what values of the properties to use?
# What final elements do you think are worth testing?


# Are there other types of batteries you're interested in? Determine what 
# properties would be necessary for another type not specified here. Choose
# an element to specify, and repeat the process.

# Were you able to find new compounds for this battery? 