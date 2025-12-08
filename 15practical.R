# Load required libraries
library(readr)
library(dplyr)

# 1. Load dataset
shopping_trends <- read_csv("shopping_trends.csv")
print("--- Data Loaded ---")

# 2. Inspect structure and first rows
str(shopping_trends)
head(shopping_trends)

# 3. Convert character columns to factors
char_cols <- sapply(shopping_trends, is.character)
shopping_trends[, char_cols] <- lapply(shopping_trends[, char_cols], as.factor)

# 4. Summary of dataset after conversion
print("--- Summary After Factor Conversion ---")
summary(shopping_trends)

# 5. Check for missing values
print("--- Missing Values per Column ---")
colSums(is.na(shopping_trends))

# 6. Compute basic numeric summaries
numeric_cols <- sapply(shopping_trends, is.numeric)
if(any(numeric_cols)){
  numeric_data <- shopping_trends[, numeric_cols]
  print("--- Mean of Numeric Columns ---")
  print(colMeans(numeric_data, na.rm = TRUE))
  
  print("--- Max of Numeric Columns ---")
  print(sapply(numeric_data, max, na.rm = TRUE))
}

# 7. Optional: Top 3 most common entries for each factor column
factor_cols <- sapply(shopping_trends, is.factor)
for(col in names(shopping_trends)[factor_cols]){
  print(paste("--- Top 3 Most Common in", col, "---"))
  print(head(sort(table(shopping_trends[[col]]), decreasing = TRUE), 3))
}

