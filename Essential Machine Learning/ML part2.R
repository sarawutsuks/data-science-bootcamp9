# find the best hyperparameter(ค่า K) that improve model

library(tidyverse)
library(caret)
library(mlbench) # have many data set

data() # watch all data set 

data("BostonHousing")  
data("PimaIndiansDiabetes")

# clean train data
clean_df <- mtcars %>%
  select(mpg, hp, wt, am) %>% # เลือกแบบ domain knowledge
  # mean imputation
  mutate(hp = replace_na(hp, 146.68),  # if hp has NA then replace avg(hp)
         wt = replace_na(wt, 3.21)) %>%
  # remove all column that having NA  (rule of thump NA < 3-5%)
  drop_na()  

#---------------------------------------

# Linear regression
lm <- train(
  mpg ~ ., 
  data = clean_df, 
  method = "lm"
)

lm

#---------------------------------------

# KNN: K-nearest neighbors
set.seed(42) # มีการ resampling เลยต้อง set seed
knn <- train(
  mpg ~ ., 
  data = clean_df, 
  method = "knn"
)

knn

# KNN: K-nearest neighbors June model 
set.seed(42) 
knn <- train(
  mpg ~ ., 
  data = clean_df, 
  method = "knn",
  metric = "MAE" # select metric ที่ต้องการวัดผล can change metric (ie. MAE, Rsquared)
)
knn

#---------------------------------------

# Decision Tree
set.seed(42) 
dt <- train(
  mpg ~ ., 
  data = clean_df, 
  method = "rpart",
  metric = "RMSE" 
)

#---------------------------------------

# grid search กำหนดค่า K โดยการทำค่า k เป็น dataframe
k <- data.frame(k = c(3,5,7))


# train control
ctrl <- trainControl(
  method = "cv",
  number = 5, # k=5
  verboseIter = TRUE # progress bar
)

knn <- train(
  mpg ~ ., 
  data = mtcars, 
  method = "knn",
  metric = "RMSE",
  trControl = ctrl,
  tuneGrid = k
)

knn
  
#------------------------

# random k ใช้ tuneLength
knn <- train(
  mpg ~ ., 
  data = mtcars, 
  method = "knn",
  metric = "RMSE",
  trControl = ctrl,
  tuneLength = 4  # random k มา 4 ค่า
)

#note 
# Kต่ำ อาจจะ overfiting
# Kสูง อาจจะ underfitting

#--------------------------

# KNN + K-Fold CV (knn ที่ทำการเพิ่ม repeats)

ctrl <- trainControl(
  method = "repeatedcv",  
  number = 3, # k=3
  repeats = 5,
  verboseIter = TRUE # progress bar
)

knn <- train(
  mpg ~ ., 
  data = mtcars, 
  method = "knn",
  metric = "RMSE",
  trControl = ctrl,
  tuneGrid = k,
  tuneLength = 3
)

#----------------------

# save model
# .RDS extension
saveRDS(knn, "knn_model.RDS")

#load RDS
load <- readRDS("knn_model.RDS")

#--------------------------------

# Batch Processing
## Jan 2024 => train model .rds
## Feb 2024 => train model2 .rds

#--------------------------------

# normalization
## 1. min-max (feature scaling 0-1)
## 2. standardization -3sd, +3sd


x <- c(5, 10, 12, 15, 20)

## min-max
minmaxNorm <- function(x) {
  (x-min(x)) / (max(x)-min(x))
}

minmaxNorm(x)

## standardization
## center and scale
zNorm <- function(x) {
  (x-mean(x)) / sd(x)
}

zNorm(x)

#---------------------------------

# The rules of normalization
## 1. เราจะทำ normalization หลัง split data
## เพราะถ้าทำก่อน split data ข้อมูลของ train จะไหลไปอยู่ใน test (avoid data leak)
## 2. ถ้าเราใช้ Z ในการทำ standardize เราจะใช้ xbar, sd ของ train data มาทำ standardize ของ test data


# preProcess() รับ 2 argument
## - data
## - method => range, z


# มาลองใช้ preProcess() แล้วนำไปปรับตัว train data, test data

#split
train_df <- mtcars[1:20, ]
test_df <- mtcars[21:32, ]

# preProcess() method = z  => compute xbar, sd
trans_z <- preProcess(train_df, # หา xbar, sd จาก ตัว train data
                    method = c("center", "scale")) #center = xbar, scale = sd

train_df_to_z <- predict(trans_z, train_df)
test_df_to_z <- predict(trans_z, train_df)


view(train_df_to_z)


# preProcess() method = range  => compute range ค่าอยู่ระหว่าง [0-1]
trans_range  <- preProcess(train_df,
                    method = "range")

test_df_to_range <- predict(trans_range, test_df)
test_df_to_range <- predict(trans_range, test_df)






