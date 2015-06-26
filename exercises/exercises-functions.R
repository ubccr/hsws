# Interlude 4
# Writing Functions: Exercises
# ==================================
#
# Using your R editor, load this file and edit it, adding R code to complete each exercise.
# Save it.
#
# TIPS:
#   - Use comments (#) in your code, if you need to explain anything.
#   - R is case-sensitive.
# 	- Type ?<command-name> in the console to access help on an R command
#   - Highlight code you want to run, then click "Run" at the top right of this pane to see the result.
#   - To clear all variables in the workspace, click the broom icon in the Workspace pane.
#
# ---------------------------------
#
# 1. Driving Test
#
# a. Examine the drivingTest() function below, and decide what it does.
#
# b. Next, call the function several times with different inputs. 
# Does this confirm or change your explanation? What does paste()
# do?
#
# c. Is it possible to call the function with an vector or other data
# structure? With a non-numeric value? Why or why not? (Try it!)
# What happens?
#
# d. Create a vector of ages called ages, and call the drivingTest
# function using the sapply() function. Example: ages = c(12, 16, 18)
# Syntax Tip: try the following:
#
#     > sapply(ages, drivingTest)
#
# What happens? What do you notice about the output?

drivingTest = function(age) {
  
  if ( is.numeric(age) & ( length(age)==1 ) ) {
    
    if (age >= 17) {
      status ="You can drive!";
      
    } else if (age >= 16) {
      status = "You are almost old enough to drive!";
      
    } else {
      status = "You are not old enough to drive.";
      
    }  
    return(paste("You are", age, "years old.", status));
    
  } else {
    return("Please call this function with a single numeric input.");
  }    
}

age = 18;
drivingTest(age);

# ------------------------------
# 2. Miles to Kilometers Conversion
# 
# Write a simple function that accepts a numeric value, in miles, and 
# converts the value(s) to kilometers.
#
# Use the following information: 
#   kilometers = (8/5) * miles
# 
# Test the function with the following vector, and print the results.
miles = c(50, 100, 200, 275)

# What is the type (class) of the output, given the input vector miles?

# What is the type (class) of the output if you supply a single numeric value?
# What about a single character value?

# ------------------------------
# 3. Average and Standard Deviation
#
# Write a simple function that prints out the mean and standard deviation
# of an input set of numbers. Test the result on the body and brain columns of
# the dataset mammals (mammals$body in units of kg, mammals$brain in units of g).
#
# Hints: 
#   - The native R function mean() can be used for the mean.
#   - The standard deviation is calculated as the square root (sqrt()) of the variance (var())
#       of a set of numbers. Or, use native R function sd().
#   - To output the values, build a vector or data frame from your
#       calculated values, then return that:
#         c(mean=avg, stdDev=sd)
#
library(MASS) # loads the dataset called "mammals"

# ------------------------------

# 4. apply() functions
#
# The apply() family of functions can be used to call some other function multiple times, with several 
# different arguments. In this exercise we will explore the use of the sapply() function. We will use 
# it to call several R functions on a predefined dataset, and then look at the output.

# You can use the apply() family on a native R function, on a function you wrote yourself.

# a. First, create the sample dataset of US car data by running the following:
data(car.test.frame, package = "rpart")
US = car.test.frame[car.test.frame$Country=="USA", ]    # Only use American Cars
US = droplevels(US[ ,c(1,4,6:8)])                       # Only use specified columns

# b. Call head(), View(), or str() on the US dataset, to get a sense of the contents.
# How many columns does it have? What are their types?

# c. Now, call the sapply function on the US dataset, to apply the mean function to it.

# Hint: Use the syntax sapply(US, mean). Do you agree that this is equivalent to running
# mean(US$Price), followed by mean(US$Mileage), followed by the mean function of each other
# column in the US data frame? Can you see the use of the apply() family?

# d. Call the sapply function on the US dataset and the range function.

# ------------------------------

# 4.b. by() function
#
# The apply() family of functions can be used to call some other function multiple times, after first
# grouping on the data that will be operated on.
#
# In this exercise we will explore the use of the by() function. We will use 
# it to call several R functions on a predefined dataset, and then look at the output.

# As with the other apply() functions, you can use the by() family on a native R function, 
# or on a function you wrote yourself.

# First, show yourself what by() does. For this, we'll use the iris dataset. 
attach(iris)

# Use the mean() function to find the overall mean of the iris Petal.Width column. 
# Hint: use a call like: mean(iris[,"Petal.Width"])

# Then, use the by() function to find the mean of the Petal.Width column for each 
# iris Species.  Hint: use a call like: by(iris[,"Petal.Width"], Species, mean)

# Using the output of the by() call, find the mean of the means for all species.  
# It should match the overall mean you computed.

# a. Now, create a sample dataset of car data by running the following:
d = droplevels(Cars93[,c(3,5,7,8,12)] )                # Only use specified columns

# b. Call head(), View(), or str() on the d dataset, to get a sense of the contents.
# How many columns does it have? What are their types?

# To find out more about the columns in the dataset, type:
?Cars93

# Remember that the first argument to by() specifies the columns to operate on; the second 
# specifies the column whose values form groups for the data; and the last specifies the
# function. Use R help for further information (?by)

# c. Now, call the by() function on the d dataset, to apply the summary function to the price
# column while grouping on auto Type. Which auto type has the highest median price?
# What about the lowest median price? (Note that price is reported in thousands of dollars). 

# Use by() to determine how many cars in our dataset are found for each Type. 

# d. Call the by() function on the d dataset, to apply the colMeans function to the 
# MPG and engine size columns, while grouping on auto Type. What does colMeans do?
# What happens if you try to use the mean() function with by()?

# e. Call the by() function on the d dataset, to determine the standard deviation (sd) of 
# the engine size column, while grouping on auto Type. 

# Which auto type has the largest variation (standard deviation) about the engine size mean? 
# Which type has the smallest and largest mean engine size? Any surprises there? 
# Does the by() function make it easy to answer a question like this one?

# ------------------------------

# 5. Variable scope

# The scope of a variable is the context in which it is defined. This exercise provides a 
# demonstration to help you explore variable scope.

# ----

# a. Clear your workspace, then highlight and source the following definitions of x and x_function:

x = "x is a global variable."

x_function = function(){
  return(x)
}

# Here, x is a globally defined variable. Print the value of x, and print the output of the function named x_function.
# What do you expect?

# HINT: you can use
# print(x)
# and
# print (x_function() )
#
# Notice the difference between printing the function definition:
x_function
# and printing the function's output by specifying parentheses:
x_function()
# In this exercise, you should do the latter, to call the function and display its output.

# Based on the outputs you see, what do you conclude about global variables? Are you surprised by the output of x_function?
# What did you expect to see?

# ----

# b. Highlight and source the following definition of y_function:
y_function = function(){
  y = "y is a local variable."
  return(y)
}

# Here, y is a locally defined variable. Print the value of y, and print the output of the function named y_function.
# What do you expect?

# What were the outputs for y and y_function()? Based on that, what can you conclude about local variables?

# ----

# b. Highlight and source the following definitions of z and z_function:

z = "z is a global variable."

z_function = function(){
  z = "Override"
  return(z)
}

# Here, z is a globally defined variable. Print the value of z, and print the output of the function named z_function.
# What do you expect?

# What were the outputs for z and z_function()? What happened? Can you explain why?
# Is there a danger associated with using global variables?

# ------------------------------

# Function exercise in the survey dataset:
# =====================================================

# 6. In the survey dataset, convert all heights to inches ("Imperial") from Metric.

# Import the excerpted survey data frame by running the following load code:

# --- begin load code ---
library(MASS)

loadS <- function(survey) {
  # subset survey and omit NAs:
  s = data.frame(Gender=survey$Sex, 
                 Hand=survey$W.Hnd, 
                 Height=survey$Height, 
                 HtUnit=survey$M.I, 
                 Age=survey$Age);
  
  s = na.omit(s);
  
  # One-liner that converts anything labeled Imperial to Inches from cm.
  # This conversion is needed for the exercise below to work.
  s$Height[s$HtUnit=='Imperial']= s$Height[s$HtUnit=='Imperial']/2.54;
  return(s);
}

s = loadS(survey);
# --- end load code ---

# -------------------------------------------------------------------

# a. How many rows are in the data frame?

# ------------------------------------------------------------------- 

# How many height measurements are in Imperial units in the data frame? 
# How many height measurements are in Metric units?
# Hint: use table() function on the HtUnit column of the data frame.

# -------------------------------------------------------------------

# b. What is the range of Imperial heights in the data frame (in inches)?
#     What is the range of Metric heights in the data frame (in cm)?
#
#   Hint: index into the data frame, specifying:
#         Rows having Imperial (or Metric) units
#         Column of Height measurements
#       ...and take the range() of this construction.

# -------------------------------------------------------------------

# 7. Demo: Convert all heights in the data frame to inches ("Imperial") from Metric.
# one inch = 2.54 cm
#
# Implemented as a demo: look over it, play with it, understand it!
#
# First, construct a vector of the heights that are labeled 'Metric'. 
#
# To get this:
# We take the Heights column from the data frame (s$Height),
# then specify those indices having s$HtUnit equal to 'Metric'.
s$Height[s$HtUnit=='Metric']

# Create a one-liner that converts the Metric heights from cm to Inches:
#
# Set those heights labeled 'Metric' to the converted value.
s$Height[s$HtUnit=='Metric']= s$Height[s$HtUnit=='Metric']/2.54;

# Don't forget to set the Height Unit column to Imperial too!
s$HtUnit[s$HtUnit=='Metric']= "Imperial";  

# To make this into an R-style function:
convertToImperialR <- function(s) {
  s$Height[s$HtUnit=="Metric"]= s$Height[s$HtUnit=="Metric"]/2.54;
  s$HtUnit[s$HtUnit=="Metric"]= "Imperial"; 
  return(s);
}

# here's a quick test of it.
s = loadS(survey);
sImp1 = convertToImperialR(s)

# -------------------------------------------------------------------

# 8. Use the summary() function to find the mean and range for Height,
#   using the new, converted Imperial ("inches") dataset.

# -------------------------------------------------------------------

# 9. Perform conversions

# Adapt the existing function to accept a second
# argument, Metric or Imperial. If "Imperial" is passed,
# then convert all heights labeled "Metric" to "Imperial".
# If "Metric" is passed, convert all heights labeled 
# "Imperial" to "Metric".
#
# Ensure your function checks for NAs before proceeding.


