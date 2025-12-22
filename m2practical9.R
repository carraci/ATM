# Load required library
library(readr)

# Load dataset
medical_cost_prediction_dataset <- read_csv(
  "C:/Users/Adarsh/Downloads/medical_cost_prediction_dataset.csv"
)

# View dataset
View(medical_cost_prediction_dataset)

# Convert categorical variables to factors
medical_cost_prediction_dataset$smoker <- as.factor(medical_cost_prediction_dataset$smoker)
medical_cost_prediction_dataset$gender <- as.factor(medical_cost_prediction_dataset$gender)

# Create contingency table
chi_table <- table(
  medical_cost_prediction_dataset$smoker,
  medical_cost_prediction_dataset$gender
)

# Display contingency table
print(chi_table)

# Perform Chi-square test
chi_result <- chisq.test(chi_table)

# Display Chi-square test result
print(chi_result)

# =========================
# GRAPH (Mosaic Plot)
# =========================
mosaicplot(
  chi_table,
  main = "Mosaic Plot: Smoker vs Gender",
  xlab = "Gender",
  ylab = "Smoker Status",
  color = TRUE
)
