# Load library
library(dplyr)

# Create dataset with duplicates
orders_df <- data.frame(
  OrderID = c(101, 102, 102, 103, 104, 101, 104),
  Customer = c("Raj", "Bebo", "Bebo", "Charlie", "Dinesh", "Raj", "Dinesh"),
  Product = c("Laptop", "Phone", "Phone", "Tablet", "Monitor", "Laptop", "Mouse")
)

# 1. Identify duplicates
duplicates_report <- orders_df %>%
  group_by(OrderID, Customer, Product) %>%
  count() %>%
  filter(n > 1)

print("--- Duplicates Report ---")
print(duplicates_report)

# 2. Remove exact duplicates
clean_exact <- orders_df %>% distinct()
print("--- Exact Duplicates Removed ---")
print(clean_exact)

# 3. Keep unique customers (first occurrence only)
unique_customers <- orders_df %>% distinct(Customer, .keep_all = TRUE)
print("--- Unique Customers ---")
print(unique_customers)
