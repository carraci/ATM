# Install and load packages
install.packages("dplyr")
library(dplyr)
library(readr)

# Load dataset
protein <- read_csv("protein.csv")

# Quick preview
head(protein)

# ---------------------------------------------
# Method 1: Using subset() - Base R
# ---------------------------------------------

# Example 1: Single Condition
# Filter for rows where RMSD > 10
high_rmsd_subset <- subset(protein, RMSD > 10)
cat("Number of rows with RMSD > 10:", nrow(high_rmsd_subset), "\n")
summary(high_rmsd_subset$RMSD)

# Example 2: Multiple Conditions (AND)
# RMSD > 10 AND F3 > 0.25
rmsd_f3_subset <- subset(protein, RMSD > 10 & F3 > 0.25)
cat("Number of rows where RMSD > 10 AND F3 > 0.25:", nrow(rmsd_f3_subset), "\n")
head(rmsd_f3_subset)

# Example 3: Multiple Conditions (OR)
# F8 > 50 OR F9 > 38
special_subset <- subset(protein, F8 > 50 | F9 > 38)
cat("Rows where F8 > 50 OR F9 > 38:", nrow(special_subset), "\n")
head(special_subset)

# ---------------------------------------------
# Method 2: Using filter() - dplyr
# ---------------------------------------------

# Example 1: Single Condition
# Filter for F1 < 8000
low_f1_filter <- protein |>
  filter(F1 < 8000)

cat("Rows where F1 < 8000:", nrow(low_f1_filter), "\n")
summary(low_f1_filter$F1)

# Example 2: Multiple Conditions (AND)
# F2 > 2000 AND F6 < 100
f2_f6_filter <- protein |>
  filter(F2 > 2000, F6 < 100)

cat("Rows where F2 > 2000 AND F6 < 100:", nrow(f2_f6_filter), "\n")
head(f2_f6_filter)

# Example 3: Using %in% (set membership)
# Filter where F8 is either 29, 39, or 70
f8_selected <- protein |>
  filter(F8 %in% c(29, 39, 70))

cat("Rows where F8 is 29, 39, or 70:", nrow(f8_selected), "\n")
table(f8_selected$F8)







