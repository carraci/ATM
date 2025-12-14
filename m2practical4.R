# Load dataset
data(ToothGrowth)

# View first few rows
head(ToothGrowth)

# One-sample t-test
# Null hypothesis (H0): mean tooth length = 18
# Alternative hypothesis (H1): mean tooth length ≠ 18
t_test_result <- t.test(ToothGrowth$len, mu = 18)

# Print result
print(t_test_result)

