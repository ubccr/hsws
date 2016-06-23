# Interlude 2
# Vector/Data Frame exercises
# ==================================
#
# Using your R editor, load this file and edit it, adding R code to complete each exercise.
# Save it with a new name. Then you'll have a record of how you solved the exercises.
#
# TIPS:
#  	- Use comments (#) in your code, if you need to explain anything.
# 	- R is case-sensitive.
# 	- Type ?<command-name> in the console to access help on an R command
#   	- Highlight code you want to run, then click "Run" at the top right of this pane to see the result.
#   	- To clear all variables in the workspace, click the broom icon in the Workspace pane.
#
# -----------------------------

# I. Accessing data in vectors
#
# There are several ways to extract data from a vector. Here is a summary showing both slicing and 
# extraction by conditionals (logic). Experiment with these operations to solve the problems below.
# 
# length(x)     # how many elements?
# x[2]          # return ith element; (i = 2)
# x[-2]         # return all but ith element; (i = 2)  
# x[1:5]        # return first k elements; (k = 5) 
# x[(length(x)-5+1):length(x)]    # return last k elements; (k = 5)
# x[c(1,3,5)]                   # return specific elements; (First, 3rd and 5th)
# x[x>3]                        # return all elements that are greater than some value (the value is 3) 
# x[ x< -2 | x > 2]             # return elements bigger than or less than some values (the value is 2) 
# which(x == max(x))            # return index that corresponds to the largest value

# define the vector x by running the following line:
x = c(313, 284, 311, 280, 322, 324, 302)

# Use the Environment tab's Grid setting, or the class(), dim(), and str() functions,
# to learn about the vector x. 

# Use the constructions above to find the following for the vector x using logic and conditionals. 
# There is often more than one way to do these! Make your solutions as general as possible.
#
#   a. All but elements 2, 6, and 7 of x
#   b. The last 2 elements of x
#   c. All elements of x that are less than 290
#   d. The index of x that corresponds to the smallest value
#   e. The value of element x[10]. What does it mean?
#   f. x[-10]. What does it mean?
#   g. Create a new vector containing the first and the last element of x.
#   h. What does x[0] mean? Is it useful to know in the R language? 	

# --------------------------------

# II. Vectors and type

# a. Create a variable w, a vector containing three character strings, such as:
w = c("red", "orange", "green")  

# b. Create a variable y, a vector containing any three numeric values.

# c. Create a vector x, containing the two vectors y and w.
# Hint: use the c() function to make a vector of vectors.	

# d. What is the type of each vector: w, y, and x? Why does x have this type? 
# Hint: Use class() to find the types. 
#
# -------------------------------

# III. survey and NA Data Frame exercise
# =======================================

# 1. Import the excerpted survey data frame, s,  by running the following:
library(MASS)
s = data.frame(Gender=survey$Sex, 
			          Hand=survey$W.Hnd, 
			          Height=survey$Height, 
			          HtUnit=survey$M.I, 
			          Age=survey$Age)
			          
# In the Environment tab of RStudio (upper Right), select Grid and then click
# on the grid icon to display the data set in its entirety. Scroll through and
# explore the dataset. What does it contain?

# -------------------------------------------------------------------

# 2. How many rows are in the data frame s?
# 
# Hints: use the dim() function to find the data frame's dimensions,
#   or use the summary() or View() function.

# -------------------------------------------------------------------

# 3. Columns of the data frame 
#
# a. What columns are in the data frame s? What are their types?
# Hint: Use summary() on the data frame s.

# b. Are there NAs in the data frame s? In which columns? How many?

# -------------------------------------------------------------------

# 4. Accessing data in the data frame 
#
# a. Run the function str() on the data frame s. What does it tell you?

# b. Run the function head() on the data frame s. 

# c. Programmatically retrieve all Gender values from the data frame s. 
# (Write an expression in code that does this) Can you think of 3 different
# ways to do this?

# d. Confirm the following two ways to retrieve the first 10 Gender values from the data frame s:

# Retrieve the Gender column (s$Gender), then index into it like an array:
s$Gender[1:10]

# Index into the rows 1:10, then the column "Gender": s[rows, column]
s[1:10,"Gender"]

# Use summary() for the following questions. Notice that it works on numeric or
# categorical data:

# e. Find the min and max ages in the dataset. Did any subjects not report an age?

# f. Find the counts of females and males in the dataset. Did any subject not report a
# gender? How many?

# g. Find the counts of left and right-handedness in the dataset. Did any subjects not report a
# handedness? How many?

# Use which() to help subset the data frame for the following questions:

# h. Print out the rows describing all left-handed females in the dataset. How would you get 
# rid of NAs? Try using which().

# i. How many males under age 18 in the dataset? List their heights, with units. Did any
# not report a height? How many?

# -------------------------------------------------------------------

# 5. In this exercise you will create a subset of the data frame that 
# contains no NAs. In other words, we will create a new data frame that
# excludes all rows that are incomplete (have NAs) for any of the measures 
# Gender, Hand, Height, and Age. 
#
# The sections outlined below take you through one way to do this exercise.
# Can you think of other ways?

# a. Determine which row indexes have NAs for each measure (Gender, 
# Hand, Height, HeightUnit, Age).
#
# Hint: Using the is.na() function, generate vectors of TRUE/FALSE NA for 
# each measure. Remember that TRUE means "is.na".
# Use Height as a model:
htIdx=is.na(s$Height)

# b. Verify that each vector you created in a. has the same number of elements as 
# the original data frame has rows. Use length() function.

# c. Use logical OR to find the row indexes for which s contains an NA for ANY measure.
#  Call this vector "NAIdx".
#     Hint: use a logical OR (| operator) of all the vectors you found in part a.

# d. Create a new data frame from the rows of s that have complete data. Call this 
# data frame sg (for s "good").
#
# Hint: 
#   Index into the rows of data frame s with the vector of row indices 
#	you found in part c.
#   Remember that FALSE means "NOT NA", so for complete data, we want the rows 
# that are FALSE.

# e. Verify your work in section d. by looking at the rows of s that are incomplete.
#   Remember that TRUE means "is NA", so for incomplete data,
#   we want the rows that have NAIdx==TRUE.
#
# Hint: use summary(), or print() or View() the rows having NAIdx==TRUE.

# f. Verify that no NAs are present in the new data frame, sg. Use summary() and View().
# Hint: If summary() finds no NAs, in the data frame sg, your work is correct.

# g. How many complete records are in the new dataset?

# h. There is a native R way to create a new dataset that contains no missing data, in a single line:
# sg2 = na.omit(s)
# Try it out! Is the result the same as the sg data frame you generated?

# -------------------------------------------------------------------

# 6. Find the mean and range for Age, on both the original dataset and the new dataset. 
#   Ensure you do not get NA for any answer (Hint: use na.rm=TRUE, or summary(), on the 
#   original dataset)
#
# Do you see differences between the two sets of calculations? If so, why?

