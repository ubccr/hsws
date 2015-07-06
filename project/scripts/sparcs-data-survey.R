# Descriptive statistics in the SPARCS 2011 dataset
# sparcs-data-survey.R

# This project introduction digs into some basic descriptive statistics on the numeric
# columns of the SPARCS 2011 dataset.

# ensure your sparcs dataset is loaded
vidiaPath = "/data/hs-workshop/"
filename = "sparcs_2011.csv"
filename=paste0(vidiaPath,filename);

s = read.csv(filename, header = TRUE)

# GENERAL

# What sort of data does the dataset contain? What does a single
# record represent? 

# take a look at the output of the str() function. Look at the head() of
# the dataset.

# Is there missing data in some columns? How can you check? Why do
# you think this might be true?

# Explain why you might expect data to be missing in a dataset of this kind.

# ------

# How many records does the dataset contain overall? What does this represent?

# ------

# How many ways of representing patient diagnosis and procedure are there?
# Browse through some of the possible values.

# ------

# What do severity of illness and risk of mortality appear to mean? How
# about medical_surgical, and the APR_ columns?  Browse through some of the 
# possible values and learn what's there.

# ------

# How many admissions in each NYS county in the year 2011? What's
# the summary of this count of admissions (in other words, what are
# the min, max, median admissions per county)? 

# Can you draw conclusions about the min and max? About the typical
# values?

# Plot this admission counts data summary as a boxplot to help you 
# visualize it. 

# ------

# USEFULNESS

# Who would want to analyze data of this type? Economists? Public
# health experts? Insurance companies? Fraud investigators? State
# or federal government? Hospital administrators? What kinds of
# things can we learn from these data? Do you think it's useful?

# Why are these data de-identified? Is that important?

# ------

# CHARGES

# Have a look at the overall summary of charges in the entire dataset. 
# Do you see some outliers? How do you check? Make a plot that helps
# you visualize the distribution of charges. 

# What is the overall total? What does this figure mean?

# Compare to population
# - - - - - - - - - - - -

# What was the population of NYS in 2011? How much money was spent
# on hospital stays for each resident of the state in that year?

# Compare to GSP
# - - - - - - - - - - - -

# Find a figure on the internet describing the overall GDP (GSP) of 
# New York State.
#
# How does this hospital inpatient charges total compare to the 
# Gross State Product of NYS?
#
# https://en.wikipedia.org/wiki/List_of_U.S._states_by_GDP

# Range
# - - - - - - - - - - - -

# What is the maximum charge overall? The minimum? Look at these
# individual data records. Does anything surprise you about them?


# Mode
# - - - - - - - - - - - -

# Use the provided mode function to look at the most typical charge.
# what's the most commonly occurring charge per county? 

mode <- function(x) {
  ux <- unique(x);
  ux[which.max(tabulate(match(x,ux)))]; 
}

# Is the mode calculation meaningful on these data? Tip: Round the mode 
# using signif() before the computation. 

# Tip: use by() to help you. View the summary of the modes across all
# counties, and prepare a plot that shows them as a boxplot.
#
# Tip: convert the output of by() to a vector (as.vector()), then 
# we can do summary stats on it!

# Interpreting costs
# - - - - - - - - - - - -
#
# What do costs really mean in the dataset? Have a look at this ("Converting charges...",
# "Caveats...")
# https://health.data.ny.gov/api/assets/A4E24A08-E42A-4DC5-ACAE-F98AB15B0A05?download=true

# Does this help? Or does it just confirm that these figures are pretty muddy?


# ------------------

# LENGTH OF STAY

# Have a look at the overall statistical summary of length of stay. What is the overall 
# total? What does this figure mean? Find a population figure for NYS for
# the relevant year. How many overnights spent in the hospital in that year, 
# per state resident? How many years does the overall length of stay figure represent?

# Comment about the summary statistics for this figure. What is a typical 
# hospital stay in NYS? What statistical figure would you use to describe this?
# (e.g. mean? median?)

# Find a way to plot the length of stay for the whole dataset. What does this
# plot show you that you see in the summary statistics? What does it show about 
# the mean, the median, and the max? 

# What does the maximum appear to mean? How frequently does it occur in the dataset?


# --------------------------------------


# LENGTH OF STAY, CHARGES


# Plot the frequencies of length of stay and charges.
# What does this plot tell you? What is the best way to represent this plot?

# Are there outliers in the cost, charges, and length of stay data?
 

# --------------------------------------------------------

# HIGH AND LOW CHARGES

# find the highest charge in each county.
# find the lowest.

# give a statistical summary of the high and low charges across all counties.
# In other words, compare minimum charges across all counties, and then do
# the same for the maximum charges.
# What does this show? Does anything surprise you?

# Try showing these results using boxplots and summary()

# ----------------

# AGE 

# How are age groups represented in the dataset? Can you think of a
# way or ways to visualize the distribution of age groups across the
# entire dataset? Make a plot.

# (Note that age is pre-binned so a bar chart is effectively a fixed-bin histogram)
# does this have any relationship to the minimum stay barplot you made? why?

