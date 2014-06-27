# piecharts-Cars93.R
#
# --------------- pie charts -------------
#
# What can pie charts tell us? 
# 	- a general graphical sense of the contents and distribution of some single 
#         variable in our dataset
# 	- establish whether we need to perform some binning for histograms
# 	- assist in data exploration
#
# Pie charts can be made regardless of whether a variable is categorical or 
# numeric. Either way, we need to have small number of distinct values for an 
# effective visual presentation.
#
# Basic syntax:
#   pie( x=table(data.frame.column.name) )

library(MASS)
cr = Cars93

# --- what's in the dataset?  ---
?Cars93

# --------- super basic pie chart -----------------

# to create a pie chart we need to compute the counts of distinct values of our 
# variable. Use a contingency table to count up numbers of cars having certain numbers 
# of cylinders:
table(cr$Cylinders)

# Now call the pie() function. This one is as basic as possible! Please use labels!
pie(table(cr$Cylinders))

# plain jane: pie chart of Cylinders (categorical) from Cars93 data
slices <-table(cr$Cylinders)
lbls <- levels(cr$Cylinders)
pie(slices, 
    labels = lbls, 
    col=rainbow(length(lbls)),
    main="Example Piechart: Number of Cylinders in Auto Dataset")

# --------- pie chart with computed percentages -----------------  
#
# A statement from the R pie() function help. Do you agree?
#   "Pie charts are a very bad way of displaying information. The eye is good at 
#   judging linearmeasures and bad at judging relative areas. A bar chart...is a 
#   preferable way of displaying this type of data."
#
# Let's compute percentages of all areas to assist us in interpreting the pie chart.
#      
# pie chart of Cylinders from Cars93 data        
# same chart, with percents on the labels:    
slices <-table(cr$Cylinders)
lbls <- levels(cr$Cylinders)
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, "Cylinders:", pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # add % to labels
pie(slices,
    labels = lbls, 
    col=rainbow(length(lbls)),
    main="Example Piechart: Number of Cylinders in Cars93 Dataset") 

# --------------- Piechart function with percentages ------------------

# Here is a general makePie() function, plus calls for a number
# of different variables in the Cars93 dataset:

# ----------------------------------------------------
# makePie()
#   col: column (numeric or categorical) in Cars93 dataset
#   name: string name to appear in title of piechart
#   sub: subtitle to appeaer under the title, blank by default
#
# Plot pie chart with percents calculated for each slice,
# adding a title and optional subtitle.
#
# Tip: vary the location of your subtitle by adding the line
# parameter to title() as follows:
#   title(sub=subname, line=-30) 
# ----------------------------------------------------
makePie <- function(col, name, subname=NA) {
  
  # determine slices in the pie:
	slices <-table(col)
	
  # check for categorical or numeric and assign labels:
	if (is.factor(col)) {
	  lbls <- levels(col)
	} else { 
    # make it a factor, then get levels:
	  lbls <- levels(factor(col))
	}
  # calculate percentage for each slice
	pct <- round(slices/sum(slices)*100)
	
  # construct labels for the slices:
  lbls <- paste(lbls, ":", pct) # add percents to labels
	lbls <- paste(lbls, "%" ,sep="") # add % to labels
  
  # plot it:
	p <- pie(slices,
          labels = lbls,             # add the labels
          col=rainbow(length(lbls)), # assign fancy colors
	       main=paste(name, "in Cars93 Dataset")
	)

  # add a subtitle
  title(sub=subname) 
}

# ---------- a few examples using the makePie() function call: --------------
#
makePie(cr$Type, "Vehicle Type")
makePie(cr$DriveTrain, "Vehicle Drivetrain Type")
makePie(cr$Turn.circle, "Turn Circle", "U-Turn space (feet)")
#makePie(cr$Passenger, "Max Number of Passengers")
#makePie(cr$Cylinders, "# Cylinders")
#makePie(cr$AirBags, "Vehicle Airbags")
#makePie(cr$Origin, "Vehicle Origin")
#makePie(cr$Man.trans.avail, "Manual Transmission Available")
#makePie(cr$Luggage.room, "Luggage Room", "Luggage capacity (cubic feet)")

# These variables have too many possible values in the dataset to make 
# good pie charts as they are. Instead, try hist or barplot to represent. 
# them. Can you think of another way to display this information?
#
#makePie(cr$Manufacturer, "Vehicle Manufacturer")
#makePie(cr$RPM, "RPM")
#makePie(cr$EngineSize, "Engine Size","liters")
#makePie(cr$Horsepower, "Maximum Horsepower")
#makePie(cr$Weight, "Vehicle Weight (pounds)")
#makePie(cr$Length, "Length (inches)")
#makePie(cr$Wheelbase, "Wheelbase (inches)")

# Exercise: after collecting similar horsepower or engine size data into
# bins or groups, plot an effective pie chart.