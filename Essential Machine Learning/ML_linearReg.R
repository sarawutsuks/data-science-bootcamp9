# load library
library(caret)

# split data mtcars 80/20

set.seed(42)
n <- nrow(mtcars)
id <- sample(n, size = 0.8*n)

train_data <- mtcars[id, ]
test_data <- mtcars[-id, ]

nrow(train_data)
nrow(test_data)

# split data use function
split <- function(data) {
  set.seed(42)
  n <- nrow(data)
  id <- sample(n, size = 0.8*n)
  train_data <- mtcars[id, ]
  test_data <- mtcars[-id, ]
  return(list(train_data, test_data))
}

split_data <- split(mtcars) #ฝากค่าที่รับจาก return

nrow(split_data[[1]]) # 25 row  80%
nrow(split_data[[2]]) # 7 row   20%


# train model
lm_model <- train(mpg ~ hp, data = split_data[[1]], method = "lm")
lm_model


# score and evaluate
p <- predict(lm_model, newdata = split_data[[2]]) # เอา test_data ไปแทนค่าใน lm_model

## calculate RMSE
error <- split_data[[2]]$mpg - p # Actual - Predict
rmse <- sqrt(mean(error^2))

# compare Train RMSE VS. Test RMSE (ต้องการให้มีค่าใกล้เคียงกัน)
rmse  # RMSE ของการ test model
lm_model$results[[2]] # RMSE ตอนเรา train model


