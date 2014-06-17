# Interlude 5
# Visualizing Data in R: Plotting exercises
# =========================================
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
#   - To clear all plots in the workspace, click the broom icon in the Plots pane.
#
# -------------------------------

# 1. Elastic band data frame
# 
# The following data gives, for each amount by which an elastic band is stretched over the end of a
# ruler, the distance that the band moved when released:
# 
# stretch 46 54 48 50 44 42 52
# distance 148 182 173 166 109 141 166

# a. Use the following data frame in R for the exercise:
elasticband <- data.frame(stretch = c(46, 54, 48, 50, 44, 42, 52),
                          distance = c(148, 182, 173, 166, 109, 141, 166)
                          )

# b. Which is the dependent variable, and which is the independent variable? Which axis should
# each be plotted on?


# c. In the data frame called elasticband, plot distance against stretch. Label your axes and the plot.
# Reminder: scatter plot syntax is: plot(formula=y~x, data=dataframe, main="plot title")


# -------------------------------------------------------------

# 2. Snow cover data frame
# 
# The following ten observations, taken during the years 1970-79, are on October snow cover for Eurasia.
# (Snow cover is in millions of square kilometers):
# 
#   year snow.cover
#   ---- ----------
#   1970 6.5
#   1971 12.0
#   1972 14.9
#   1973 10.0
#   1974 10.7
#   1975 7.9
#   1976 21.9
#   1977 12.5
#   1978 14.5
#   1979 9.2
# 
# a. Use the following data frame in R for the snow cover exercises:
snowcover <- data.frame(year=c(1970:1979),
                        snow.cover=c(6.5, 12.0, 14.9, 10.0, 10.7, 7.9, 21.9, 
                                     12.5, 14.5, 9.2)
                        )

# b. Which is the dependent variable, and which is the independent variable? Which axis should
# each be plotted on?


# c. Plot snow.cover versus year. Label your axes and the plot.


# d. Use the hist() command to plot a histogram of the snow cover values. Label your axes and the plot. 
# Hint: use the histogram syntax: hist(x=data, xlab="x-label", main="title")


# e. Find the R summary of the snow cover column. Then make a boxplot of the snow cover column.
# The boxplot should just be a graphical representation of the statistical summary you printed.
# Hint: use the summary() command, and boxplot syntax: boxplot(x=data, ylab="y-label", main="title")


# -------------------------------------------------------------

# 3. Mammals data frame
#
# The built-in data set mammals contains data on body weight versus brain weight for 
# 62 species of land mammals. Use the command ?mammals to find out about the dataset.
# First, load the dataset from the MASS package, using the command:
data(mammals, package="MASS")

# a. Use the cor() function to find the correlation coefficient for body and brain weights. 
# What does this coefficient suggest about the body and brain weights of land mammals?


# b. Plot the data using the plot command, and label the plot and axes (include units). 
# You should be unsatisfied with this plot. Next, plot the logarithm (log) of each 
# variable; does that make a difference?


# c. Overlay the log-log plot with a linear model. Are you satisfied with the fit?
#     Hint: the linear model takes the form lm(y~x). To overplot, call abline() on the linear model.
#     Don't forget that you have taken the log of the quantities on both axes.
#
# What do your log-log plots and the correlation results suggest about the data?

# -------------------------------------------------------------

# 4. Cars93 plots
#
# For these exercises, load the Cars93 dataset from the MASS package. You can adapt some of
# the plot examples from class to create these plots.

# load the data:
data(Cars93, package="MASS")
cr=Cars93

#
# a. Make a histogram and density plot of Engine Size (displacement), plotted on the same
#   'page'. Label the axes on the histogram. Compare the histogram and density plots.


# b. Make a boxplot of the Cars93 dataset drivetrain types with engine RPM. Label the axes and the plot.
#   Use color to distinguish the categorical variable values.
# 
#   Remind yourself:
#   What do the ends of the boxes and the dotted lines mean? Are there any outliers? Can you find
#   the cars represented by them?


# c. For this exercise, don't worry about labels or nice presentation; concentrate on comparing the
#    different plot types:
#
#     Create a simple histogram, a density plot, and a barplot of the Luggage Room variable from the Cars93 
#     dataset. Which representation makes more sense to you? Would a pie chart be
#     an effective way to represent this information about the Cars93 dataset?


# d. Make a barplot of the Cars93 dataset by origin (USA/non USA) broken down by manual transmission
#   availability.
#   Don't forget to include a legend that indicates the color coding of the categorical variables,
#   and label your axes and the plot appropriately.
#   Can you conclude anything about whether Americans seem to prefer a manual or automatic transmission?


# e. Create a piechart of Vehicle Airbags from the Cars93 dataset. Display each category's percentage 
#   of the total dataset. Include a plot title.


# -------------------------------------------------------------

# 5. In the library MASS is a dataset called UScereal, which contains information about popular 
# breakfast cereals. Access the data set as follows:
#   
# data(UScereal, package="MASS") # load the UScereal data frame
# names(UScereal)                # to see the names of the columns
# 
# Now, pick one of the following relationships to investigate, and comment on what you see. 
# You can use tables, barplots, scatterplots, descriptive statistics, etc. to do your investigation.
# 
# a. The relationship between fat and vitamins
# b. the relationship between carbohydrates and sugars
# c. the relationship between fiber and manufacturer
# d. the relationship between sodium and sugars
# 
# Are there other relationships you can predict and investigate?

data(UScereal, package="MASS")
names(UScereal)
u = UScereal

