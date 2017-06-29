
# You have been asked to decide on a new material with which to design disk 
# drives. You will be investigating the properties that are necessary to 
# design a disk drive and using these to make your decision.

#######################  Materials Science Background  #######################
# Magnetic saturation refers to the state where an increase in a magnetic 
# field applied to a material will not increase the magnetic charge of the 
# material. 
# Disk drives use magnetic surfaces to store information, so 
# changing the magnetization of the surface can corrupt or destroy stored 
# data. 
# A high magnetic saturation is therefore desirable, since it means that 
# a disk drive can withstand more magnetic force before being altered.

# Maximum temperature is the highest temperature the material can reach before 
# it is altered.

# Rare earth (RE) elements are a classification that includes scandium, 
# yttrium, and the set of lanthanides. 
# Rare earth elements are difficult to mine and extract in large enough 
# quantities to be economical. 
# They are also in high demand due to the variety of applications, which
# can lead to high prices during supply shortages.
##############################################################################

# Import compound-data.csv and elemental-data.csv into data frames.
# Remember to include headers.


###  Part 1: Property Estimation  ###

# What properties go into the design of your disk drive? 
# Think about what you look for when buying a computer or laptop.
# One major factor is price.
# Another consideration is disk drive performance and data loss.
# What else would you (as a consumer) consider?

# Estimate the desired additional properties not included in the compound 
# data set and add the estimated values to the data frame.
# One way to approach this would be to add two columns containing the data
# for A and B, and then making a third column by operating on the two new
# columns to get the compound data. 
# Compounds are 50% A-50% B, which can be used when estimating new values.

# If you choose to use density, you should instead use the formula
# Ra^3/(Ra^3 + Rb^3) * Da + Rb^3/(Ra^3 + Rb^3) * Db = Dab
# where Ra is the atomic radius of element A, Rb is the atomic radius of 
# element B, Da is the density of element A, Db is the density of element B, 
# and Dab is the density of the compound. 
# This gives a more accurate estimation of the density, as it accounts for 
# differences in contribution due to volume.


### Part 2: Element Comparisons ###

# Make a boxplot comparing the magnetic saturation of compounds with and 
# without rare earth elements.

# Also make a plot of magnetic saturation versus compound price for compounds.

# What does this indicate about rare earth elements?
# What factors limit the use of substitutes for RE elements?


### Part 3: Design  ###

# Return to the properties and data you decided were important in Part 1.
# Make several plots comparing properties of interest.
# Use these plots to narrow down the available materials to the one
# you recommend using to make disk drives.
# Your plots should include titles, axis labels, and a line or lines 
# indicating where you chose to set a cutoff.
# You may also wish to label the points in your plot, instead of searching 
# the data frame by values to find a particular compound.

# You have some freedom in deciding what properties to compare. 
# The goal is to find an optimal material to use based on the properties
# that you determined earlier. 
# There is no objectively correct answer - you just want to find a material 
# that meets the requirements you specified, and be able to justify your 
# final decision. 
# This does mean, however, that you should be satisfied with the properties 
# you include and understand why you included them.

# Often you find that there's a trade-off between desirable properties. 
# An excellent material may be very expensive, with a very cheap
# alternative that only performs half as well. 
# You can decide which properties are very important and which are flexible,
# and use that to determine what material to use. 
# You can also try to find a material that is a reasonable compromise of every
# property, rather than finding the material with the best specific property.

# What compound would do you ultimately consider optimal?

# Now exclude rare earth elements from your data set and repeat the previous 
# steps. What new compound did you use? 

# Do a little research on hard disk drives vs. solid state drives.
# Based on your work and research, what do you expect to see in the future? 


### Links for possibly interesting articles
# http://volga.eng.yale.edu/teaching-resources/hard-drives/methods-and-materials
# http://www.explainthatstuff.com/harddrive.html
