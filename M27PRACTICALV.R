# Load library
library(readr)

# Read data
sales_data <- read_csv("C:/Users/IT-27/Downloads/sales_data.csv")

# Rename columns (if not already named)
colnames(sales_data) <- c("OrderID","CustomerID","ProductID","Quantity",
                          "Price","OrderDate","Status",
                          "PaymentMethod","Region","Discount")

# Convert data types
sales_data$Region <- factor(sales_data$Region,
                            levels = c("North","South","East","West","Central"))
sales_data$Price <- as.numeric(sales_data$Price)

# Remove missing values
sales_data_clean <- na.omit(sales_data[, c("Price","Region")])

# ---- CLEAR BOXPLOT ----
boxplot(
  Price ~ Region,
  data = sales_data_clean,
  main = "Distribution of Sales Price by Region",
  xlab = "Region",
  ylab = "Sales Price",
  col = "white",
  border = "black",
  lwd = 2,
  cex.axis = 1.1,
  cex.lab = 1.2,
  cex.main = 1.3,
  outline = TRUE
)

# Add grid for clarity
grid(nx = NA, ny = NULL)
