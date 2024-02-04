library(caret)
library(tidyverse)

# preview data
glimpse(mtcars)

# use function train() from caret
# เวลาเปลี่ยน algorithm แค่เปลี่ยน method


# 1. split data
train_test_split <- function(data, size) {
  set.seed(42)
  n <- nrow(mtcars)
  id <- sample(1:n, size*n)
  train_data <- mtcars[id, ]
  test_data <- mtcars[-id, ]
  return(list(train_data, test_data))
}


prep <- train_test_split(mtcars, 0.8) # รับค่าจาก return
prep[[1]] # train
prep[[2]] # test

# 2. train model

# change train control
##ctrl <- trainControl(method = "boot", number = 5)
##ctrl <- trainControl(method = "LOOCV") # leave one out CV(croos validation)
ctrl <- trainControl(method = "CV", number = 5)
  
model <- train(mpg ~ hp + wt + am, data = prep[[1]], method = "lm", trControl = ctrl)
model
model$results
summary(model)

# 3. score
p <- predict(model, newdata = prep[[2]]) # แทนค่า test data ใน model


# 4. evaluate model
error <- prep[[2]]$mpg - p  # Actual - Predict

mae_test <- mean(abs(error))
rmse_test <- sqrt(mean(error**2))

mae_test
rmse_test

rmse_train <- model$results[2]
mae_train <- model$results[4]

print(mae_train)
print(rmse_train)
print(mae_test)
print(rmse_test)

MAE(p,prep[[2]]$mpg)



