# Load built-in dataset
data(ChickWeight)

# Select weights for the first 10 chicks at day 10 and day 20
weight_day10 <- ChickWeight$weight[ChickWeight$Time == 10][1:10]
weight_day20 <- ChickWeight$weight[ChickWeight$Time == 20][1:10]

# Perform paired t-test
t.test(weight_day10, weight_day20, paired = TRUE)
