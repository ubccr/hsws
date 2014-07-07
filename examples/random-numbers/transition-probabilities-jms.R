markovProcess <- function(pn){
  
  # check that input is an integer between 1 and 3:
  if( (!is.wholenumber(pn)) || (pn > 3) || (pn < 1)) {
    return("Enter an integer between 1 and 3");
  }
  
  probability_vector <- c(.6,.1,.3)
  pm <- sample(probability_vector,1)
  r <- runif(1,0,1)
  
  print(pm)
  print(r)
  
  while(pn == pm){
    pm <- sample(probability_vector, 1)
  }
  if(pm > pn){
      new_pn <- pm
      new_state <- which(probability_vector==new_pn)
      return(paste("New state:", new_state, "probability:", pm, sep=" "))
  } else if(pm/pn > r){
      new_pn <- pm
      new_state <- which(probability_vector==new_pn)
      return(paste("New state:", new_state, "probability", pm, sep=" "))
  } else {
      new_pn <- pn
      new_state <- which(probability_vector==new_pn)
      return(paste("State does not change:", new_state, "probability", pn, sep=" "))
  }
}

# helper function determines whether input is a whole number:
is.wholenumber <- function(x, tol = .Machine$double.eps^0.5)  abs(x - round(x)) < tol