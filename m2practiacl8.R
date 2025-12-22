# ===============================
# TWO-WAY ANOVA WITH GRAPH (ONE CODE)
# ===============================

# Install required package (run once)
install.packages("ggplot2")

# Load libraries
library(readr)
library(ggplot2)

# Load dataset
global_climate_energy_2020_2024 <- read_csv(
  "C:/Users/Adarsh/Downloads/global_climate_energy_2020_2024.csv"
)

# Create factor variables
global_climate_energy_2020_2024$Year <-
  as.factor(format(global_climate_energy_2020_2024$date, "%Y"))

global_climate_energy_2020_2024$country <-
  as.factor(global_climate_energy_2020_2024$country)

# Two-Way ANOVA
anova_model <- aov(
  energy_consumption ~ Year * country,
  data = global_climate_energy_2020_2024
)

# ANOVA result
summary(anova_model)

# Interaction Plot
ggplot(
  global_climate_energy_2020_2024,
  aes(x = Year, y = energy_consumption, color = country, group = country)
) +
  stat_summary(fun = mean, geom = "line", linewidth = 1) +
  stat_summary(fun = mean, geom = "point", size = 2) +
  labs(
    title = "Two-Way ANOVA Interaction Plot",
    x = "Year",
    y = "Mean Energy Consumption"
  ) +
  theme_minimal()

