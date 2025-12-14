# -------------------------------
# Frequency Tables in R
# -------------------------------

# ---------- Dataset 1: airquality (built-in) ----------

# Load built-in dataset
data(airquality)

# Frequency table using base R
table(airquality$Month)

# Frequency table using dplyr::count()
install.packages("dplyr")   # run once
library(dplyr)

count(airquality, Month)


# ---------- Dataset 2: tobacco (CSV file) ----------

# Load readr package
install.packages("readr")   # run once
library(readr)

# Read CSV file
tobacco <- read_csv("C:/Users/Adarsh/Downloads/tobacco.csv")

# View dataset
View(tobacco)

# Frequency table using base R
table(tobacco$tahun)

# Frequency table using dplyr
count(tobacco, tahun)

