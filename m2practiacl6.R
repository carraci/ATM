# Load library and dataset
library(readr)
IMDB_Dataset <- read_csv("C:/Users/Adarsh/Downloads/IMDB Dataset.csv")
View(IMDB_Dataset)

# Create numeric variable: length of each review
IMDB_Dataset$review_length <- nchar(IMDB_Dataset$review)

# Select first 10 review lengths as "before" and next 10 as "after"
before <- IMDB_Dataset$review_length[1:10]
after  <- IMDB_Dataset$review_length[11:20]

# Perform paired t-test
result <- t.test(before, after, paired = TRUE)

# Print result
print(result)
