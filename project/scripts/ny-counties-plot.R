# NYS County GIS dataset plotted with 2011 SPARCS data.
# ggplot with fortify() and merge()
# JMS
# initial dev: 21 May 15

# Be sure to refer to the gis-data-overlays.txt file for more information and tips

# load includes
if(!exists("readSparcs", mode="function")) source("scripts/gis/gisIncludes.R");
loadGisPackages();

# load sparcs data
if (!exists("s")) s=readSparcs( '/data/hs-workshop' );

# load the GIS data.
# use readShapePoly() since it's what we've used the most:
path=paste0( "../data/gis" );
counties=loadShapefile(path, "counties");

# ----------------------------------------------------------------------

# pull out GIS lat, long data from the counties shapefile, in a way ggplot can understand.
# Hint: use the fortify() function on counties dataframe, as described in this reference:
# http://rstudio-pubs-static.s3.amazonaws.com/11196_2ac0fb4e6c93425ab7ddd4ccc61c5e47.html
# The fortified dataframe should have a new name, like 'counties.f'.
#
# Then, convert the id column to a factor (categorical data column) using as.factor().

counties.f=fortify(counties, region="NAME") # 116861 obs
counties.f$id = as.factor(counties.f$id) # convert id to factor.

# Now, use merge() to fold the other data fields back into the GIS data frame:
# The result should be a new data frame. 
counties.m=merge(x=counties.f,  # 116861 obs
             y=counties@data,
             by.x="id",
             by.y="NAME",
             all=TRUE # very important!! if you neglect this you will have an incomplete plot.
             )

# ------------------------------------------------

# Check out your merged dataset. How many counties are there? Any NAs?

# ------------------------------------------------

# plot something on a map!

# try coloring by a column from the dataframe we joined back to.
# plot the results of fortify and merge. Use syntax like the following:
Map <- ggplot(counties.m, aes(x=long, y=lat, group=group, fill=sq_miles)) + geom_polygon() + 
  coord_equal() + labs(x = "long", y = "lat", fill = "sq miles") + 
  ggtitle("NY State Counties")
Map

# What do you see? How does it look?

# ------------------------------------------------

# can we merge back to the hospital admissions dataset?
# 2011 SPARCS data: hospital admissions, statewide, deidentified.

# Test it out by plotting the count of hospital admissions by county.
# First, how would you determine this value? Try out the computation
# without doing the plotting. Hint: try using the table() operator.

# Next, create a data frame that contains only the names of the NYS
# counties and their admissions counts. Hint: extract the counts 
# and the names from the output of the table() operator.

# Check the classes, check for NAs. Does it look like the right computation?

# ------------------------------------------------

# Do the data merge and plot the result.

# Merge the hospital admissions by county with the counties data frame (as we
# did above), and create the GIS plot from this data frame (also as we did above).

# How does your plot look? Why?

# Hint: how many counties are in your SPARCS dataset? How about in your GIS
# dataset?


# ------------------------------------------------

# Ensure that we represent all NYS counties in the sparcs subset.

# find counties not represented in sparcs and create a data frame
# for them. Then, merge the unrepresented counties with your computation
# result (hospital admissions by county) data frame.

# Ensure the correct columns and names are present!

# Finally, merge the hospital admissions by county with the counties data frame.
# Give this its own name. You will plot from this data frame!

# ------------------------------------------------

# First, make the plot with no coloring.

# Then, try using the 'fill' parameter on the aes argument and the labs argument.

# Take a look at the POP2000 column in the data frame. Can this help you to scale
# by the population of each county? Give it a try.

# If you have made a plot you are happy with, add labels to clarify it and save it.

# ------------------------------------------------

# 

# ------------------------------------------------

# Create a function that generalizes the process of merging the data frames and plotting 
# different quantities from your dataset.

# ------------------------------------------------

# Now that you have the function, explore some more computations that can be performed,
# by county. Take a look at this information on cancer and respiratory disease in NYS.
# Consult other sources if you wish:

# http://www.health.ny.gov/prevention/prevention_agenda/indicators/county/warren.htm
# http://www.acscan.org/ovc_images/file/action/states/ny/NY_Cancer_Burden_Report_2012.pdf

# Can you explain the features or tendencies you see in your GIS plots? Are you limited by
# the information in your dataset? What does the data show you? Anything surprising?

# count of hospitals per county (subset and count)
#       Is this more interesting by population? Or reported without population? Try both ways.

# cancer cases by county (requires grep command)

# emergency admissions by county
# elective admissions by county

# respiratory disease by county
# circulatory disease by county

# highest charge per county
# lowest charge per county
# mode of charges per county

# max length of stay per county
# min length of stay per county
# mean or median length of stay per county
