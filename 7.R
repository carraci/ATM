# Load the necessary library. 
# 'dplyr' is the key package for data manipulation and includes the select() function.
# It is part of the 'tidyverse'.
# If you don't have it installed, run: install.packages("tidyverse")
library(dplyr)

# ----------------------------------------------------------------------
# 1. Dataset Setup
# We will use the built-in 'iris' dataset for demonstration.
# The original columns are: Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species.
# ----------------------------------------------------------------------

# View the structure of the original dataset
print("Original iris dataset structure:")
str(iris)
cat("\n")


# ----------------------------------------------------------------------
# 2. SELECTING (KEEPING) VARIABLES
# To keep specific variables, simply list their names inside select().
# ----------------------------------------------------------------------

# Example 2a: Keep only Sepal.Length and Species
iris_selected <- iris %>%
  select(Sepal.Length, Species)

print("2a. Dataset with ONLY Sepal.Length and Species (Selected):")
head(iris_selected, 3)
str(iris_selected)
cat("\n")

# Example 2b: Keep a range of columns using the ':' operator (useful for contiguous columns)
# This selects all columns from Sepal.Length up to Petal.Width
iris_range_selected <- iris %>%
  select(Sepal.Length:Petal.Width)

print("2b. Dataset selecting a range of columns (Sepal.Length through Petal.Width):")
head(iris_range_selected, 3)
str(iris_range_selected)
cat("\n")


# ----------------------------------------------------------------------
# 3. DROPPING (REMOVING) VARIABLES
# To drop specific variables, use the minus sign (-) before the variable name.
# ----------------------------------------------------------------------

# Example 3a: Drop Sepal.Length and Petal.Width
iris_dropped <- iris %>%
  select(-Sepal.Length, -Petal.Width)

print("3a. Dataset AFTER DROPPING Sepal.Length and Petal.Width:")
head(iris_dropped, 3)
str(iris_dropped)
cat("\n")


# Example 3b: Drop a range of columns using the negation operator (-) with ':'
# This removes all columns from Sepal.Width up to Petal.Length
iris_range_dropped <- iris %>%
  select(-(Sepal.Width:Petal.Length))

print("3b. Dataset AFTER DROPPING a range of columns (Sepal.Width through Petal.Length):")
head(iris_range_dropped, 3)
str(iris_range_dropped)
cat("\n")

# ----------------------------------------------------------------------
# 4. Advanced Selection Helpers (Optional but useful)
# ----------------------------------------------------------------------

# Example 4: Select all columns that start with "Petal"
iris_starts_with <- iris %>%
  select(starts_with("Petal"))

print("4. Dataset selecting columns that START with 'Petal':")
head(iris_starts_with, 3)
str(iris_starts_with)
cat("\n")