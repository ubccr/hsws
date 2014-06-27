# histogram-Cars93.R

# ----------------------------- histograms -----------------------------
#
# histogram: determine how many examples in the dataset fall into each "bin"
#   of a fixed size. This lets us look at the distribution of one variable 
#   in the dataset at a time.
#    
#   A call to hist() computes the distribution and plots the result.
#
#   - y axis shows the computed counts in a given "bin". 
#   - x axis must have numeric values. Otherwise you see errors like this:
#       > hist(cr$Origin)
#       Error in hist.default(cr$Origin) : 'x' must be numeric
#
#     To get numeric values, compute the contingency table first
#
#   - You can use R defaults for bin size, or specify the "breaks" 
#       parameter for a specific # bins.
#
#   - hist() provides a default title, which you can override with main()
# ----------------------------------------------------------------------

# load the Cars93 dataset
library(MASS)
cr = Cars93

# --- RPM for the Cars93 dataset (revs per minute at maximum horsepower). ---

# what can we say about the RPM column in our dataset?
table(cr$RPM)
summary(cr$RPM)

# ---- by default: histograms and RPM data ----

# Default bin algorithm is used in this plot of auto RPM data. 
# Note use of main() to override the default title.
xname="engine RPM"
hist(cr$RPM, 
     xlab=xname, 
     main=paste("histogram of",xname,"default binning"),
     col="grey")

# ----- Compare histograms to kernel density plots, and try binning: --------

# -- Horsepower --
# using the "breaks" parameter to specify an approximate # of bins
par(mfrow=c(1,3)) # put three plots on one "page"
hist(cr$Horsepower, xlab="Max Horsepower", col="green", breaks=15) # breaks 15 or 18
hist(cr$Horsepower, col="green")
plot(density(cr$Horsepower))

# -- Wheelbase --
par(mfrow=c(1,3))
hist(cr$Wheelbase, xlab="Vehicle Wheelbase/in.", col="orange", breaks=10) #  same as default
hist(cr$Wheelbase, xlab="Vehicle Wheelbase/in.", col="orange", breaks=12) # breaks 10 or 12
plot(density(cr$Wheelbase))

# -- Engine Size (displacement) --
par(mfrow=c(1,2))
hist(cr$EngineSize, xlab="Engine Size/liters", col="blue", breaks=15) # breaks 12
plot(density(cr$EngineSize))

# -- Vehicle Length --
hist(cr$Length, xlab="Vehicle Length/in.", col="yellow", breaks=10) # breaks 10 or 12
plot(density(cr$Length))

par(mfrow=c(1,1)) # restore default: one plot per page


# # -------------- EXTRA OPTION: comparing groups: kernel density ------------------
# 
# # Compare MPG distributions for cars with different numbers of cylinders
# library(sm) # need a special library, "Smoothing methods for...density estimation"
# 
# par(mfrow=c(1,2))
# 
# # ------------------------------
# 
# # compare MPGs for different transmissions: kernel density plots
# 
# # plot the densities:
# cv = c("green","blue")
# sm.density.compare(cr$MPG.highway, 
#                    as.integer(cr$Man.trans.avail), 
#                    xlab="MPG, highway",
#                    col=cv)
# title(main="Highway MPG Distribution by Man.trans.avail")
# 
# # add legend to indicate identities of line colors
# cl = levels(factor(cr$Man.trans.avail))
# legend(x="topright", 
#        cl, 
#        fill=cv,
#        title="Man Trans Avail?") 
# 
# # ---
# 
# # Same comparison plot, for city MPG:
# # plot the densities:
# cv = c("green","blue")
# sm.density.compare(cr$MPG.city, 
#                    as.integer(cr$Man.trans.avail), 
#                    xlab="MPG, city",
#                    col=cv)
# title(main="City MPG Distribution by Man.trans.avail")
# 
# # add legend to indicate identities of line colors
# cl = levels(factor(cr$Man.trans.avail))
# legend(x="topright", 
#        title="Man Trans Avail?",
#        cl, 
#        fill=cv) 
# 
# # -------------
# 
# 
# # ---- without sm library: ---
# 
# # note that using density() calls allows us to scale the individual vectors by
# # proportion of the dataset (see the weight parameter)
# 
# par(mfrow=c(1,2))
# 
# # --- highway ---
# 
# # x and y limits are found by experimentation:
# yl=c(0,0.06)
# xl=c(15,55)
# 
# # Subset the MPG.highway column on whether the Man.trans is available or not:
# manTrans =   cr$MPG.highway[which(cr$Man.trans.avail=="Yes")]
# noManTrans = cr$MPG.highway[which(cr$Man.trans.avail=="No")]
# 
# # weight each point according to the prevalence of its group in the dataset
# lm = length(manTrans)
# ln = length(noManTrans)
# len = lm+ln
# 
# # now plot one subset (no man trans):
# plot(density(noManTrans, weights=rep(1/len,ln)),
#      col="blue",
#      main="Highway MPG Distribution by Man.trans.avail",
#      xlab="MPG, highway", 
#      ylim=yl,
#      xlim=xl)
# 
# # do the overplotting with the other subset
# lines(density(manTrans, weights=rep(1/len,lm)),
#       col="red",
#       ylim=yl,
#       xlim=xl)
# 
# grid(col="grey") # add a grid
# 
# # add a legend to identify each line clearly
# legend(x="topright",
#        title="Manual trans. available?",
#        c("No","Yes"),
#        fill=c("blue","red"))
# 
# # --- city ---
# 
# # Subset the MPG.city column on whether the Man.trans is available or not:
# manTrans =   cr$MPG.city[which(cr$Man.trans.avail=="Yes")]
# noManTrans = cr$MPG.city[which(cr$Man.trans.avail=="No")]
# 
# # weight each point according to the prevalence of its group in the dataset
# lm = length(manTrans)
# ln = length(noManTrans)
# len = lm+ln
# 
# # now plot one subset (no man trans):
# plot(density(noManTrans, weights=rep(1/len,ln)),
#      col="blue",
#      main="City MPG Distribution by Man.trans.avail",
#      xlab="MPG, city", 
#      ylim=yl,
#      xlim=xl)
# 
# # do the overplotting with the other subset
# lines(density(manTrans, weights=rep(1/len,lm)),
#       col="red",
#       ylim=yl,
#       xlim=xl)
# 
# grid(col="grey") # add a grid
# 
# # add a legend to identify each line clearly
# legend(x="topright",
#        title="Manual trans. available?",
#        c("No","Yes"),
#        fill=c("blue","red"))
# 
# par(mfrow=c(1,1)) # restore default: one plot per page

# ---------- Additional explorations: overplotting kernel density plots ------------
# 
# # with sm package: compare MPGs for different drivetrains: kernel density plots
# 
# par(mfrow=c(1,2))
# 
# # plot the densities:
# cv=c("green", "blue","red")
# sm.density.compare(cr$MPG.highway, as.integer(cr$DriveTrain), xlab="MPG, highway", col=cv)
# title(main="Highway MPG Distribution by Drivetrain")
# 
# # add legend to indicate identities of line colors
# cl = levels(factor(cr$DriveTrain))
# legend(x="topright", cl, fill=cv) 
# 
# # compare MPGs for drivetrain
# # plot the densities:
# sm.density.compare(cr$MPG.city, as.integer(cr$DriveTrain), xlab="MPG, city", col=cv)
# title(main="City MPG Distribution by Drivetrain")
# 
# # add legend to indicate identities of line colors
# cl = levels(factor(cr$DriveTrain))
# legend(x="topright", cl, fill=cv) 
# 
# par(mfrow=c(1,1))
# 
# 
# # ---- without sm library: ---
# 
# # use same x and y limits in each plot
# par(mfrow=c(1,2))
# 
# # x and y limits are found by experimentation:
# yl=c(0,0.06)
# xl=c(10,57)
# 
# # Subset the MPG.highway column on whether the Man.trans is available or not:
# fourWD =   cr$MPG.highway[which(cr$DriveTrain=="4WD")]
# front =   cr$MPG.highway[which(cr$DriveTrain=="Front")]
# rear =   cr$MPG.highway[which(cr$DriveTrain=="Rear")]
# 
# # weight each point according to the prevalence of its group in the dataset
# l4 = length(fourWD)
# lf = length(front)
# lr = length(rear)
# len = l4+lf+lr
# 
# # now plot one subset (no man trans):
# plot(density(fourWD, weights=rep(1/len,l4)),
#      col="blue",
#      main="Highway MPG Distribution by Drivetrain",
#      xlab="MPG, highway", 
#      ylim=yl,
#      xlim=xl)
# 
# # do the overplotting with the other subset
# lines(density(front, weights=rep(1/len,lf)),
#       col="red",
#       ylim=yl,
#       xlim=xl)
# 
# # do the overplotting with the other subset
# lines(density(rear, weights=rep(1/len,lr)),
#       col="darkgreen",
#       ylim=yl,
#       xlim=xl)
# 
# grid(col="grey") # add a grid
# 
# # add a legend to identify each line clearly
# legend(x="topright",
#        title="Drivetrain",
#        c("4WD","Front","Rear"),
#        fill=c("blue","red","darkgreen"))
# 
# # --- city ---
# 
# # Subset the MPG.city column on whether the Man.trans is available or not:
# fourWD =   cr$MPG.city[which(cr$DriveTrain=="4WD")]
# front =   cr$MPG.city[which(cr$DriveTrain=="Front")]
# rear =   cr$MPG.city[which(cr$DriveTrain=="Rear")]
# 
# # weight each point according to the prevalence of its group in the dataset
# l4 = length(fourWD)
# lf = length(front)
# lr = length(rear)
# len = l4+lf+lr
# 
# # now plot one subset (no man trans):
# plot(density(fourWD, weights=rep(1/len,l4)),
#      col="blue",
#      main="City MPG Distribution by Drivetrain",
#      xlab="MPG, City", 
#      ylim=yl,
#      xlim=xl)
# 
# # do the overplotting with the other subset
# lines(density(front, weights=rep(1/len,lf)),
#       col="red",
#       ylim=yl,
#       xlim=xl)
# 
# # do the overplotting with the other subset
# lines(density(rear, weights=rep(1/len,lr)),
#       col="darkgreen",
#       ylim=yl,
#       xlim=xl)
# 
# grid(col="grey") # add a grid
# 
# # add a legend to identify each line clearly
# legend(x="topright",
#        title="Drivetrain",
#        c("4WD","Front","Rear"),
#        fill=c("blue","red","darkgreen"))
# 
# par(mfrow=c(1,1))
