###################

# Make Shots-Data Script
# This script prepares data about players' shots to be visualized.
# Input: players' shot data
# Output: shots-data.csv

###################

library(readr)
library(dplyr)

iguadala <- read.csv("../data/andre-iguadala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

iguadala <- mutate(iguadala, name = "Andre Iguadala")