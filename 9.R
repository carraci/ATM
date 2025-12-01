# ============================================================================== 
# Text Manipulation on icrisat_district_data
# Functions: str_sub(), str_split()
# ==============================================================================

# Load necessary libraries
library(stringr)
library(dplyr)
library(tidyr)
library(readr)

# Load dataset
icrisat_district_data <- read_csv("C:/Users/IT-28/Downloads/icrisat_district_data.csv")
View(icrisat_district_data)

# ============================================================================== 
# 1. Explore dataset
# ============================================================================== 
head(icrisat_district_data)
names(icrisat_district_data)
dim(icrisat_district_data)

# ============================================================================== 
# 2. Example: Using str_sub() to extract part of a code
# ============================================================================== 
# Suppose we have a column 'District_Code' in the format: "MP-SAG-1966"
# Extract first 2 letters as state code, last 4 as year
if("District_Code" %in% names(icrisat_district_data)) {
  icrisat_district_data$State_Code <- str_sub(icrisat_district_data$District_Code, 1, 2)
  icrisat_district_data$Year       <- str_sub(icrisat_district_data$District_Code, -4, -1)
  
  print("--- After str_sub() ---")
  print(icrisat_district_data %>% select(District_Code, State_Code, Year))
}

# ============================================================================== 
# 3. Example: Using str_split() to split text columns
# ============================================================================== 
# Suppose we have a column 'District_Info' in the format: "District-City-Population"
# Split into separate columns
if("District_Info" %in% names(icrisat_district_data)) {
  split_matrix <- str_split(icrisat_district_data$District_Info, "-", simplify = TRUE)
  
  icrisat_district_data$District <- split_matrix[, 1]
  icrisat_district_data$City     <- split_matrix[, 2]
  icrisat_district_data$Population <- split_matrix[, 3]
  
  print("--- After str_split() ---")
  print(icrisat_district_data %>% select(District_Info, District, City, Population))
}

# ============================================================================== 
# 4. Bonus: Using separate() (tidyverse way)
# ============================================================================== 
# Using the same 'District_Info' column
if("District_Info" %in% names(icrisat_district_data)) {
  tidy_data <- icrisat_district_data %>%
    separate(District_Info, into = c("District", "City", "Population"), sep = "-")
  
  print("--- Using separate() ---")
  print(tidy_data %>% select(District, City, Population))
}

