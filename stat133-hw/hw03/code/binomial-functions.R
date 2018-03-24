# title: Binomial Functions
# description: various probability functions involving binomial distributions
# author: Shaantam Chawla
# Stat 133, HW 3, Problem 3

# is_integer

#'is_integer
#'determines whether a number is an integer
#'@param x - a number
#'@return true if x is an integer, and false otherwise

is_integer <- function(x) {
  (x %% 1) == 0
}

#'is_positive
#'determines whether a number is positive or not
#'@param x - a number
#'@return true is x > 0, false otherwise

is_positive <- function(x) {
  x > 0
}

#'is_nonnegative
#'determines whether a number is non-negative, meaning greater than or equal to 0
#'@param x - a number
#'@return true if x >= 0, false if x < 0

is_nonnegative <- function(x) {
  x >= 0
}

#'is_positive_integer
#'determines if a number value is a positive integer or not
#'@param x - a number
#'@return true is x is both positive and an integer. false if either condition is not met.
is_positive_integer <- function(x) {
  (is_positive(x) & is_integer(x))
}

#'is_nonneg_integer
#'determines if a number is a non-negative integer
#'@param x- a number
#'@return true if x is both non-negative and an integer. false otherwise.
is_nonneg_integer <- function(x) {
  (is_nonnegative(x) & is_integer(x))
}

#'is_probability
#'determines if a value is a valid probability
#'@param x - a number
#'@return - return true if 0 <= x <= 1, false otherwise.
is_probability <-function(x) {
  (is_nonnegative(x) & x <= 1)
}

#'bin_factorial
#'calculates factorial of a value
#'@param x - non-negative value
#'@return - factorial of x 
bin_factorial <- function(x) {
  if (x == 0) {
    return(1)
    
  } else {
    total <- 1
    
    for(i in 2:x) {
      total <- total * i
    }
    return(total)
  }
}

#'bin_combinations
#'computes number of combinations of k successes given n trials in total
#'@param n - how many trials
#'@param k - how many successes
#'@return number of combinations C(n, k)
bin_combinations <- function(n, k) {
  return(bin_factorial(n) / (bin_factorial(k) * bin_factorial(n - k)))
}

bin_probability <- function(trials, success, prob) {
  if(!is_nonneg_integer(trials)) {
    stop('Trials cannot be negative.')
  }
  
  if(!is_nonneg_integer(success)) {
    stop('Successes cannot be negative.')
  }
  
  if(!is_probability(prob)) {
    stop('Probability must be between 0 and 1, inclusive.')
  }
  
  n <- trials
  k <- success
  bin_combinations(n, k) * (prob ^ k) * ((1 - prob) ^ (n - k))
}

bin_distribution <- function(trials, prob) {
  probs <- rep(0, trials + 1)
  for (k in (1:trials + 1)) {
    probs[k] <- bin_probability(trials, k - 1, prob)
  }
  
  distrib <- data.frame(success = 0:trials, probability = probs)
  return(distrib)
}


