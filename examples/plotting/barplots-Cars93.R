# barplots-Cars93.R
#
# -------------- bar plots ---------------

# What can barplots tell us? 
#   - a general graphical sense of the contents of one or two variables in our dataset
#   - typically used on categorical data
# 	- a visual contingency table between two variables
#   - assist in data exploration
#
# NOTE NOTE on fiddling with sizes of axis annotations:
#   to adjust x label magnification: cex.names=0.75
#   to adjust y label magnification: cex.axis=0.75
# ----------------------------------------

# load the Cars93 dataset
library(MASS)
cr = Cars93

# -------------- bar plots ---------------

# In the cars dataset, how many cylinders does the typical car have?
# Compute a contingency table using table() to find out all the counts.
# Try to answer the question using a barplot.

table(cr$Cylinders)

# cylinder count or type
# 3      4      5      6      8 rotary 
# -     --      --    --      --  ----
# 3     49      2     31      7      1 

# try with "barplot": view the car dataset by # cylinders
counts=table(cr$Cylinders) 
title="Cars93 Car Distribution by Number of Cylinders"
colors=rainbow(length(counts))
barplot(counts, 
		    main=title,
        xlab="number of cylinders", 
        ylab="car count from Cars93 dataset",
        col=colors)

# Auto Type barplot
#counts=table(cr$Type) 
# better: order Type by Weight:
type=reorder(cr$Type,cr$Weight)
counts=table(type) 
colors=rainbow(length(counts))        
title="Cars93 Car Distribution by Vehicle Type"
barplot(counts, 
		    main=title,
        xlab="Vehicle Type", 
        ylab="car count from Cars93 dataset",
        col=colors)        

# Manufacturer
counts=table(cr$Manufacturer) 
colors=rainbow(length(counts))      
title="Cars93 Car Distribution by Vehicle Manufacturer"  
barplot(counts, 
        main=title,
        cex.names=0.7,   # adjust size of x axis labels: 70%
        las=2,           # rotate x axis labels                
        xlab="",         # suppress name label for x axis
        ylab="car count from Cars93 dataset",
        col=colors)    
        
# ---------- barplots on combination of variables: contingency table --------------

# Now combine them into a contingency table! 
        
# Transmission Type and Vehicle Type        
# order Type by Weight first:
type=reorder(cr$Type,cr$Weight)
counts=table(cr$Man.trans.avail, type) 
title="Cars93 Car Distribution by Vehicle Type and Manual Transmission Available"
barplot(counts, 
		    main=title,
        xlab="Vehicle Type", 
        ylab="car count from Cars93 dataset",
        col=c("red","darkblue"),
        #legend=levels(cr$Man.trans.avail) # to specify legend in barplot call
        )
legend(x="topright",                # location for legend
       title="Man. Trans. Available?",   # title for legend
       levels(cr$Man.trans.avail),               # names in legend
       bty="n",                                  # box type to draw around legend
       fill=c("red","darkblue"))                 # colors for legend
                 
        
# Passengers and Vehicle Type        
# order Type by Weight first:
type=reorder(cr$Type,cr$Weight)
counts=table(cr$Passengers, type) 
title="Cars93 Car Distribution by Vehicle Type and Max. Passengers"
barplot(counts, 
		main=title,
        xlab="Vehicle Type", 
        ylab="car count from Cars93 dataset",
        col=rainbow(length(table(cr$Passengers))))
        #legend=levels(factor(cr$Passengers)))       
legend(x="topright",                      # location for legend
       title="Max # Passengers",          # title for legend
       levels(factor(cr$Passengers)),     # names in legend
       fill=rainbow(length(table(cr$Passengers)))) # colors for legend

      