# ==============================================================================
# R Script: Reshaping Data with pivot_longer() and pivot_wider()
# Dataset: submission (1).csv
# ==============================================================================

library(dplyr)
library(tidyr)
library(readr)

# ==============================================================================
# 1. IMPORT DATA
# ==============================================================================

submission_1_ <- read_csv("C:/Users/IT-28/Downloads/submission (1).csv")

# Rename columns properly for clarity
colnames(submission_1_) <- c("ProductID", "Score")

cat("\n--- 1. Original Data ---\n")
print(head(submission_1_, 10))

# ==============================================================================
# 2. CREATE EXTRA COLUMN FOR PIVOTING (Required)
# ==============================================================================

# Create a second metric for practical demonstration
submission_1_ <- submission_1_ %>%
  mutate(Score_Adjusted = Score * 100)

cat("\n--- 2. Data After Creating Second Metric ---\n")
print(head(submission_1_, 10))

# ==============================================================================
# 3. PIVOT_LONGER (Wide ??? Long)
# ==============================================================================

long_df <- submission_1_ %>%
  pivot_longer(
    cols = c(Score, Score_Adjusted),
    names_to = "Metric",
    values_to = "Value"
  )

cat("\n--- 3. Long Format Data (pivot_longer) ---\n")
print(head(long_df, 10))

# ==============================================================================
# 4. PIVOT_WIDER (Long ??? Wide)
# ==============================================================================

wide_df <- long_df %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )

cat("\n--- 4. Wide Format Data (pivot_wider) ---\n")
print(head(wide_df, 10))

# ==============================================================================
# 5. ADVANCED REPORT PIVOT (Score Category Example)
# ==============================================================================

# Create Score Category Column
submission_1_ <- submission_1_ %>%
  mutate(Score_Level = case_when(
    Score < 0.5 ~ "Low",
    Score >= 0.5 & Score < 0.8 ~ "Medium",
    Score >= 0.8 ~ "High"
  ))

# Category-wise pivot
report_pivot <- submission_1_ %>%
  select(ProductID, Score_Level, Score) %>%
  pivot_wider(
    names_from = Score_Level,
    values_from = Score
  )

cat("\n--- 5. Category-wise Score Pivot ---\n")
print(head(report_pivot, 10))

# ==============================================================================
# END OF SCRIPT
# ==============================================================================

