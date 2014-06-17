# Interlude 1
# Datatype/variable exercises
# ==================================

# Using your R editor, load this file and edit it, adding R code to complete each exercise.
# Save the file. Then you'll have a record of how you solved the exercises.

# TIPS:
# 	Use comments (#) in your code, if you need to explain anything.
# 	Remember that R is case-sensitive.
# 	Use ?<command> in the console to access help on commands or functions

# ---------------------------------

# 1. Defining variables
#
# a. Make the following variable assignments in R:
#
# r = exp(2)         	# exponential function
# q = abs(3 - 7)     	# Absolute value of (3-7)
# y = "TRUE"    			
# x = FALSE
# z = NA
#
# b. Using R, find and print the class of each variable. What do you notice about variable y?

# c. Using R, find and print the logical opposite of each variable. Again, what do you notice
# about variable y?

# When done with the exercise, use the broom icon to clear your RStudio workspace.

# ---------------------------------

# 2. Logical variables
#
# Perform the following in R:
# a. Define variable u as logical True, v as logical False. Hint: these reserved words must
# be all capitals (case is important in R).

# b. In R, determine whether u and v are both true.

# c. In R, determine whether at least one of u OR v is true.

# d. In R, find the opposite of v. 

# When done with the exercise, use the broom icon to clear your RStudio workspace.

# ---------------------------------

# 3. Strings and concatenation 

# a. Assign your first and last names to R two separate R variables.

# b. Use the function paste() to assign the result to a new variable.
# If you need to look up how to use paste, enter "?paste" at the
# command line to bring up the help page.

# c. Print the new variable. Print its type (use the function class()).

# When done with the exercise, use the broom icon to clear your RStudio workspace.

# ---------------------------------

# 4. A temperature conversion

# Calculate the Fahrenheit temperatures that correspond to 20 to 25 degrees Celcius, 
# using the steps below.

celsius = c(20:25)	# sets a vector variable to contain the integers 20 through 25

# a. Complete the assignment for the fahrenheit variable. Use the formula:
# 		fahrenheit = (9/5) * celsius + 32
#
# fahrenheit = 

# b. Uncomment this line to create a data frame containing the temperature conversion:
# conversion = data.frame(Celsius=celsius, Fahrenheit=fahrenheit)

# c. Print the temperature conversion.

# You should see:
#   Celsius Fahrenheit
# 1      20       68.0
# 2      21       69.8
# 3      22       71.6
# 4      23       73.4
# 5      24       75.2
# 6      25       77.0

# d. Find and print the class of each variable.

# e. Find and print the structure of each variable. Use the function str().
# What does this function do? Take a look at the help page, using ?str at
# the command line.





