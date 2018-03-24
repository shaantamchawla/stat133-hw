###################

# Make Shot-Charts Script
# This script creates shot charts
# Input: players' shot data
# Output: various scatterplots of shot data

###################

library(readr)    # importing data
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

court_pic <- '/stat133/stat133-hw/images/nba-court.jpg'

andre <- read_csv('/stat133/stat133-hw/data/andre-iguadala.csv')
draymond <- read_csv('/stat133/stat133-hw/data/draymond-green.csv')
kevin <- read_csv('/stat133/stat133-hw/data/kevin-durant.csv')
klay <- read_csv('/stat133/stat133-hw/data/klay-thompson.csv')
stephen <- read_csv('/stat133/stat133-hw/data/stephen-curry.csv')
all <- read_csv('/stat133/stat133-hw/data/shots-data.csv')

andre_iguadala <- ggplot(data = andre) + 
  geom_point(aes(x = x, y = y, color = andre$shot_made_flag))

ggsave(filename ='/stat133/stat133-hw/images/andre-iguadala-shot-chart.pdf', plot = andre_iguadala, width = 6.5,height = 5)

draymond_green <- ggplot(data = draymond) + 
  geom_point(aes(x = x, y = y, color = draymond$shot_made_flag))

ggsave(filename ='/stat133/stat133-hw/images/draymond-green-shot-chart.pdf', plot = draymond_green, width = 6.5,height = 5)

kevin_durant <- ggplot(data = kevin) + 
  geom_point(aes(x = x, y = y, color = kevin$shot_made_flag))

ggsave(filename ='/stat133/stat133-hw/images/kevin-durant-shot-chart.pdf', plot = kevin_durant, width = 6.5,height = 5)

klay_thompson <- ggplot(data = klay) + 
  geom_point(aes(x = x, y = y, color = klay$shot_made_flag))

ggsave(filename ='/stat133/stat133-hw/images/klay-thompson-shot-chart.pdf', plot = klay_thompson, width = 6.5,height = 5)

stephen_curry <- ggplot(data = stephen) + 
  geom_point(aes(x = x, y = y, color = stephen$shot_made_flag))

ggsave(filename ='/stat133/stat133-hw/images/stephen-curry-shot-chart.pdf', plot = stephen_curry, width = 6.5,height = 5)

shots <- ggplot(data = all) + 
  geom_point(aes(x = x, y = y, color = all$shot_made_flag)) + 
  facet_wrap(~ name)

ggsave(filename ='/stat133/stat133-hw/images/gsw-shot-facets.pdf', plot = shots, width = 8,height = 7)

