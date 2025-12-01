# ============================================================================== 
# Data Cleaning: Handling Missing Values in R
# Functions: na.omit(), replace_na()
# ============================================================================== 

# Load necessary libraries
library(dplyr)
library(readr)
library(tidyr)  # replace_na() is from tidyr

# ============================================================================== 
# 1. Import dataset
# ============================================================================== 
icrisat_district_data <- read_csv("C:/Users/IT-28/Downloads/icrisat_district_data.csv")
View(icrisat_district_data)

# ============================================================================== 
# 2. Explore missing values
# ============================================================================== 
# Check total number of missing values per column
print("--- Missing values per column ---")
print(colSums(is.na(icrisat_district_data)))

# View rows with missing values
print("--- Rows with missing values ---")
print(icrisat_district_data[!complete.cases(icrisat_district_data), ])

# ============================================================================== 
# 3. Handling missing values
# ============================================================================== 

# 3A. Remove rows with any missing values using na.omit()
clean_data_omit <- na.omit(icrisat_district_data)
print("--- Dataset after na.omit() ---")
print(clean_data_omit)

# 3B. Replace missing values with a default value using replace_na()
# Example: replace numeric NAs with 0, character NAs with "Unknown"
clean_data_replace <- icrisat_district_data %>%
  replace_na(list(
    District = "Unknown",
    State = "Unknown",
    Population = 0,
    Area = 0,
    Year = 0
  ))

print("--- Dataset after replace_na() ---")
print(clean_data_replace)

# ============================================================================== 
# 4. Verify missing values are handled
# ============================================================================== 
print("--- Missing values after cleaning ---")
print(colSums(is.na(clean_data_replace)))

