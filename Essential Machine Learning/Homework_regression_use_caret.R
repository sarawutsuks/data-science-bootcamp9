library(caret)
library(tidyverse)

df <- read.csv("Starbucks_in_California.csv")

glimpse(df)

# prepare data
# select columns that we want
df <- df %>%
  select(n_star = Number.of.Starbucks, 
         age = Median.Age, 
         income = Median.Household.Income, 
         pop = X2010.Population) %>%
  mutate(age = as.numeric(age),
         income = as.numeric(gsub('\\$|,', '', income)), # change dollar format to numeric
         pop = as.numeric(pop)) %>%
  na.omit() 


# Split data (Train 80%, Test 20%)
set.seed(42)
n <- nrow(df)
id <- sample(1:n, 0.8*n)
train_data <- df[id, ]
test_data <- df[-id, ]

nrow(train_data)
nrow(test_data)


# Fit model
# n_star = b0 + b1*income + b2*age + b3*pop
model <- train(n_star ~ income + age + pop,
               data = train_data,
               method = "lm")

# predict
p <- predict(model, newdata = test_data)

error <- test_data$n_star - p  # Actual - Predict

mae_test <- mean(abs(error))
rmse_test <- sqrt(mean(error**2))


  
  
  
