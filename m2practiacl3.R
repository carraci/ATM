# Load necessary libraries
library(readr)

# ---------------------------
# Part 1: mtcars two-way table
# ---------------------------
data(mtcars)

# Convert variables to factor
mtcars$cyl <- factor(mtcars$cyl)
mtcars$gear <- factor(mtcars$gear)

# Two-way table: cyl vs gear
cyl_gear_table <- table(mtcars$cyl, mtcars$gear)
print("Two-way table of cyl vs gear:")
print(cyl_gear_table)

# Optional: show row & column totals
print("Table with margins:")
print(addmargins(cyl_gear_table))

# ---------------------------
# Part 2: Load IMDB dataset
# ---------------------------
IMDB_Dataset <- read_csv("C:/Users/Adarsh/Downloads/IMDB Dataset.csv")

# View dataset
View(IMDB_Dataset)

# Example: frequency table of sentiment
print("Frequency table of sentiment:")
print(table(IMDB_Dataset$sentiment))

