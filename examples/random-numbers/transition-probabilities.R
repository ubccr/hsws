# transition-probabilities.R
# assume 3 states are governed by transition probabilities

markovProcess <- function(initial_state){
  # input: integer-valued initial state between 1 and 3, assumed adheres to 
  #   probability_vector
  # output: next state and its probability
  
  # check that input is an integer between 1 and 3:
  if( (!is.wholenumber(initial_state)) || (initial_state > 3) || (initial_state < 1)) {
    return("Enter an integer between 1 and 3");
  }
  
  # define the probability and state vectors for all states
  probability_vector <- c(.6,.1,.3)
  state_vector <- c(1,2,3)
  
  # determine index, probability of current state
  state_index <- which(state_vector==initial_state)
  pn <- probability_vector[state_index]
  
  # select one of the unoccupied states, m; read that state's probability
  m <- sample(state_vector[-state_index],1)
  pm <- probability_vector[which(state_vector==m)]
  
  r <- runif(1,0,1)
  
  # now evaluate final state for this round:
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
is.wholenumber <- function(x, tol = .Machine$double.eps^0.5) abs(x - round(x)) < tol
