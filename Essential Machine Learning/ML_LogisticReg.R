library(caret)

data("mtcars") # clean data mtcars

# prep data
mtcars$am <- factor(mtcars$am,
                    levels = c(0,1),
                    labels = c("Auto", "Manual"))


# split data use function
split <- function(data) {
  set.seed(42)
  n <- nrow(data)
  id <- sample(n, size = 0.7*n)
  train_data <- mtcars[id, ]
  test_data <- mtcars[-id, ]
  return(list(train_data, test_data))
}

split_data <- split(mtcars) #ฝากค่าที่รับจาก return

# train model
glm_model <- train(am ~ mpg, data = split_data[[1]], method = "glm")
glm_model

# score and evaluate
p <- predict(glm_model, newdata = split_data[[2]])


# compare Train accuracy VS. Test accuracy
accuracy <- mean(p == split_data[[2]]$am) 

glm_model$results[[2]] # Train accuracy
accuracy  # Test accuracy



