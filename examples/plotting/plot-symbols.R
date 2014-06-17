# R plotting finery
#

# maindonald's plot colors example function
# from usingR.pdf
view.colours <- function(){
  
  # display default palette:
  plot(1, 1, xlim=c(0,14), ylim=c(0,3), type="n", axes=F,
       xlab="",ylab="")
  text(1:6, rep(2.5,6), paste(1:6), col=palette()[1:6], cex=2.5)
  text(10, 2.5, "Default palette", adj=0)
  
  # display "rainbow" palette with a vector of length 7:
  rainchars <- c("R","O","Y","G","B","I","V")
  text(1:7, rep(1.5,7), rainchars, col=rainbow(7), cex=2.5)
  text(10, 1.5, "rainbow(7)", adj=0)
  cmtxt <- substring("cm.colors", 1:9,1:9)
  
  # Split “cm.colors” into its 9 characters
  text(1:9, rep(0.5,9), cmtxt, col=cm.colors(9), cex=3)
  text(10, 0.5, "cm.colors(9)", adj=0)
}

# To run the function, enter
view.colours()


# -------------

# Plotting symbols, from Maindonald usingR:
# 3.3.1 Size, colour and choice of plotting symbol

# For plot() and points() the parameter cex (“character expansion”) controls the size, while col (“colour”)
# controls the colour of the plotting symbol. The parameter pch controls the choice of plotting symbol.
# The parameters cex and col may be used in a similar way with text(). Try

displayPlotSymbols <- function() {
  plot(1, 1, xlim=c(1, 7.5), ylim=c(1.75,5), type="n", axes=F, xlab="",
       ylab="")
  # Do not plot points
  box()
  points(1:7, rep(4.5, 7), cex=1:7, col=1:7, pch=0:6)
  text(1:7,rep(3.5, 7), labels=paste(0:6), cex=1:7, col=1:7)
  
  # The following, added to the plot that results from the above three statements, demonstrates other choices of pch.
  points(1:7,rep(2.5,7), pch=(0:6)+7)
  
  # Plot symbols 7 to 13; use pos to position the text.
  # different values of pos position the text with respect to the point:
  #   1=below, 2=left, 3=top, 4=right. 
  points(1:7,rep(2,7), pch=(0:6)+14)
  
  # Label with symbol number
  # Plot symbols 14 to 20
  text((1:7), rep(2,7), paste((0:6)+14), pos=4) # Labels with symbol number
}

# now call the plot symbols function
displayPlotSymbols();