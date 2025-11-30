library(readr)

df <- read_delim(
  "C:/Users/Adarsh/Downloads/global_disaster_response_2018_2024 (1).csv",
  delim = NULL,
  guess_max = 5000
)

View(df)

