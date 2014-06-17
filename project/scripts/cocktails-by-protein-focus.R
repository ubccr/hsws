# The HWI protein crystallization project
# focus: cocktails across various proteins
# 7 Jun 2013

# --------- Load dataset ---------

# drop, experiment, sample datasets

# load the factorify function:
source("./project/scripts/generalFactorifyFunction.R")


# -------------- All experiments, crystal/nocrystal, by protein ---------------------

# Determine the counts of experiments broken down by crystal state, then protein number.
# You'll need the table() function to create a contingency table.
# Save the output as a variable, since you will use it several times.

# Use this contingency table to find the statistical summary of non-crystallization counts per protein.

# Now find the statistical summary of crystallization counts per protein

# Display the summary statistics graphically, by creating a basic boxplot of the table you have created.
#
# The box plot should agree with the summary statistics you computed above. But, R needs to be
# told which dimension of your table to perform statistics along. This is why
# the boxplot formula has the form y ~ grp, where y is a numeric vector of data values to be 
# split into groups according to the grouping variable grp. So, we split the table by its rownames
# which label the crystal/nocrystal assignment for each protein column.
#
# How should you label this plot? How could it be improved?

# --- How many crystallized proteins were found for each week in the dataset? --- TODO: timeseries only?

# Use a subset of the experiment data frame that contains only successful crystallizations. 

# What percentage of the dataset is this, broken down by week?

# -------- Max # of multiple crystallizations by cocktails ----------

# We would like to know which chemical cocktails have been most successful, so that we could
# use similar combinations for future experiments. 

# Were multiple crystallizations achieved by some cocktails? What was the maximum number
# of crystallizations achieved for a single cocktail? How many cocktails crystallized this many proteins?
# What percentage of the total number of cocktails is this?

# To answer the question we can look at the largest value in a contingency table (use max()), and the number
# of times that value appears in the table (use sum() and a conditional)

# ----- Are there some cocktails that didn't crystallize anything? -------

# If we were designing experiments for HWI we might want to exclude these cocktails from the next screen
# of similar proteins! How many cocktails are there in our dataset that did not crystallize anything
# in this dataset? What percentage of our total set of cocktails is this?
#
# Make a pie chart showing the cocktails that crystallized one or more samples in the dataset,
# and those that did not.

# ------ Which cocktails achieved the maximum number of crystallizations? In which weeks? ------

# Hint: take subsets of your crystallized-cases data frame, factorify, then subset and use
# contingency tables and the which() function.

# --- What are the components of these cocktails? ---

# Use the drop data frame to report on the chemical components.

# ------------ Which proteins were crystallized by these cocktails? -----------------

# Prepare and display the contingency table. Then, sum the crystallizations by protein number in the
# contingency table (hint: use colSums() or rowSums()). What do these sums mean?

# Is there a protein you are particularly interested in, based on this analysis?
# Look up its information on PDB.

# -------successful crystallizations: # cocktails that achieve # crystallizations --------------

# List the number of crystallizations achieved per cocktail, for each number up to the maximum,

# Make a barplot showing the counts of chemical cocktails that achieve 1, 2, ... max crystallizations.
# Label your axes and the plot.

# (Optional)
# Make a piechart displaying the counts of chemical cocktails that achieve 1,2...max crystallizations.
# Display the percentages and provide a title for the plot.

# ------------- Looking at PDB and the experiment images ---------------

# Pick your favorite protein and look it up on the PDB (Protein Data Bank). Learn what organism
# makes it, what it does, and what its structure looks like. To do this, look in the experiment
# data frame, in the targetdb_status column. Use this value in the PDB (rscb.org).

# View some images of experiments on this protein. Can you identify which ones look crystallized?
# Here, use the merge() command on experiment and expUrl data frames. Find your protein and look
# at some image urls.
