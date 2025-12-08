# ==============================================================================
# R Script: Extracting Date Components from Random Dates using lubridate
# ==============================================================================

# 1. Load Necessary Libraries
install.packages("lubridate")  # Only run once
install.packages("dplyr")      # Only run once

library(lubridate)
library(dplyr)

# ==============================================================================
# 2. CREATE RANDOM DATASET
# ==============================================================================

set.seed(123)  # For reproducibility

# Generate 10 random dates between 2020-01-01 and 2025-12-31
random_dates <- as.Date("2020-01-01") + sample(0:2190, 10)  

random_df <- data.frame(
  Event_ID = 1:10,
  Date_String = as.character(random_dates)
)

print("--- Random Dataset ---")
print(random_df)

# ==============================================================================
# 3. PARSE AND EXTRACT DATE COMPONENTS
# ==============================================================================

processed_data <- random_df %>%
  mutate(
    Actual_Date = ymd(Date_String),          # Parse string to Date
    Year_Num = year(Actual_Date),            # Year
    Month_Num = month(Actual_Date),          # Month number
    Month_Name = month(Actual_Date, label = TRUE, abbr = FALSE), # Full month name
    Day_Num = day(Actual_Date),              # Day of month
    Weekday_Num = wday(Actual_Date),         # Day of week number (1=Sun)
    Weekday_Name = wday(Actual_Date, label = TRUE, abbr = FALSE), # Full weekday name
    Quarter = quarter(Actual_Date),          # Fiscal quarter
    Day_of_Year = yday(Actual_Date)          # Day number in the year
  )

print("--- Data with Extracted Date Components ---")
print(processed_data)

# ==============================================================================
# 4. EXTRACT COMPONENTS FROM CURRENT SYSTEM TIME
# ==============================================================================

current_time <- now()
print("--- Current Time Extraction ---")
print(paste("Current Year:", year(current_time)))
print(paste("Current Month:", month(current_time, label = TRUE, abbr = FALSE)))
print(paste("Current Day:", day(current_time)))
print(paste("Current Hour:", hour(current_time)))
print(paste("Current Minute:", minute(current_time)))
print(paste("Current Second:", second(current_time)))

