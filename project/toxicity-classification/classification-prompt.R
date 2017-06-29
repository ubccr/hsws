# For this project, you will be classifiying metal oxide nanoparticles as 
# toxic or non-toxic, based on cytotoxicity data. 

#######################  Materials Science Background  ########################
# Metal oxide nanoparticles are useful for a variety of medical applications. 
# They can be used in MRIs to increase contrast, as carriers in targeted drug 
# delivery, and in bone repair or replacement.
# However, a major concern in the use of these nanoparticles is toxicity. 
# Some metals, when taken into the body, impair function and can lead to 
# long-term health effects. 
# Others are non-toxic or even essential, such as iron. 

# Data on cytotoxicity, or the damage that a material does to cells, is 
# compiled along with the known toxicities of certain compounds.
# Your goal is to find a reasonable value for a cytotoxicity cut-off. 
# That is to say, you will be looking for a value above which a material is 
# likely toxic, and below which a material would likely be safe to use. 
###############################################################################

# Import toxicity-classification.csv into a data frame.

###  Part 1: Boxplots  ###

# Make a boxplot comparing the cytotoxicity values of the toxic and non-toxic
# elements.
# Be sure to include labels in your plot.


###  Part 2: Confusion Matrix  ###

# To use the cytotoxicity as a classifier, we need to pick a value to use as a 
# threshold. 
# Since we also know which elements are and are not toxic, we can compare 
# between the actual class and the class predicted by the classifier, using a 
# table called a confusion matrix.

# When comparing the classifier's results to the true classification, there 
# are four possible outcomes:

# True positive - both the actual classification and the predicted 
# classification are positive. 
# (So, the cytotoxicity is above the predicted toxic threshold, and the 
# material is actually known to be toxic.)

# True negative - both the actual classification and the predicted 
# classification are negative.

# False positive - the actual classification is negative, but the predicted 
# classifiation is positive.

# False negative - the actual classification is positive, but the predicted 
# classification is negative. 

# Therefore, values below the classifier threshold are considered toxic, and 
# values above the classifier threshold are not.
# We want to find the threshold that gives the greatest amount of correct and 
# fewest amount of incorrect classifications. 

# From your boxplots, determine a reasonable range of possible thresholds.
# You can use the seq() function to generate a sequence of values, or simply
# specify them in a vector.


# Write a function that generates a confusion matrix.
# To do this, the function should accept a value to use as the threshold,
# then determines the number of true positives, true negatives, false 
# positives, and false negatives found using that threshold value.

# In addition, look up the formulae for sensitivity, specificity, precision,
# and accuracy, and calculate them in the function.

# Finally, the function should return all of these values in a data frame.


# Apply the function to each possible threshold value.
# What command lets you apply the function to every threshold value at once?

###  Part 3: Comparison of Classifications  ###

# From your confusion matrix, decide on an optimal threshold value.

# Based on the threshold, make two histograms: one of the predicted toxic
# elements, and the other of the predicted non-toxic elements.
# Show both histograms in the same plot, differentiated by color. 
# Include labels and a legend. 

# You can use the assign the hist() command to a variable to save the values
# without plotting them, then use the plot() and lines() commands to draw 
# the histograms on the same set of axes.

# Make another set of histograms to show the actual cytotoxicities of the 
# toxic and non-toxic nanoparticles. 
# Once again, show both histograms in the same plot, including labels and a
# legend.

# How well did the classifier perform?

###  Part 4: ROC Plot  ###

# A ROC plot is a curve that compares the true positive rate to the false 
# positive rate given by a classifer (which is the same as sensitivity vs. 
# (1-specificity)). 
# A perfect result would have the point (0,1) on the curve, indiciating a 100% 
# true positive rate and a 0% false positive rate. 
# A useless test is just a straight diagonal line, since it doesn't 
# differentiate between true and false positives.
# A test that has the point (1,0) on the curve, indicating a 0% true positive 
# and 100% false positive rate, is not actually a useless result. 
# By redefining the positive and negative results, it becomes a perfect test.

# Load the "Epi" library.

# Then, use the function ROC() to create a ROC plot. 
# You can choose to show the cutpoints you used by setting the "cuts" parameter
# in the ROC plot.
# You can also include other parameters such as the optimal cutpoint, model 
# summary, and area under the curve.
# If you need it, ?ROC provides the documentation for the ROC function.

### Further Research  ###

# Do some additional research on metal nanoparticles.
# What interesting applications or problems can you find?

# Links for possibly interesting articles:
# http://www.azonano.com/article.aspx?ArticleID=4280
# https://phys.org/news/2017-03-chemists-nanoparticles-safe-imaging-tumors.html
# https://www.sciencedaily.com/releases/2016/11/161108085901.htm
# http://www.slate.com/articles/technology/future_tense/2016/09/using_machine_learning_to_predict_how_nanoparticles_will_react_in_the_human.html