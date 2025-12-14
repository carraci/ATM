# Built-in dataset
head(mtcars)
summary(mtcars)

# Descriptive statistics using psych
install.packages("psych")   # run once
library(psych)
describe(mtcars)

# Read external dataset
library(readr)
tobacco <- read_csv("C:/Users/Adarsh/Downloads/tobacco.csv")
View(tobacco)

