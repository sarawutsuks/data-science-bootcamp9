
# build ML to classicfly diabets patiens
# binary classicfication

library(tidyverse)
library(caret)
library(mlbench)
library(MLmetrics)

# load dataset
data("PimaIndiansDiabetes")
df <- PimaIndiansDiabetes

# explore dataset
glimpse(df)
  
# check NA
complete.cases(df) # check NA

# select 

data <- df %>%
  select(2,5,6,8, diabetes)

glimpse(data)

# split data
set.seed(42)
n <- nrow(data)
id <- sample(n, size = 0.8*n)
train_data <- data[id, ]
test_data <- data[-id, ]

# train
set.seed(42)

# use metric Accuracy
# ctrl <- trainControl(method = "cv", number = 5) #defalut เป็น Accuracy

# use metric AUC, Precision, Recall, F
ctrl <- trainControl(method = "cv",
                     number = 5, 
                     summaryFunction =  prSummary, # pr = precision + recall
                     classProbs = TRUE) # calculate probability

# note
# ถ้าเราต้องการเปลี่ยนจาก metric Accuracy เป็นตัวอื่นๆเช่น AUC(area under the curve เข้าใกล้1 ยิ่งดี), Precision, recall, f1
# เราต้อง set ctrl โดยการเพื่ม 
# summaryFunction = prSummary, classProbs = True
# เสร็จแล้วเราจะไปเปลี่ยน metric ใน model ว่าเราต้องการให้ model ยึด metric ตัวไหนเป็นหลัก เช่น ถ้าเลือก Recall model จะคำนวณ recall ให้มีค่าสูงสุด
# เราสามารถเปลี่ยน method เป็น KNN ได้
# และถ้าเราเลือก metric เป็น Recall 
# model KNN จะเลือกค่า K ที่ทำให้ Recall มีค่าสูงสุด
 





logistic_model <- train(diabetes ~ .,
                  data = train_data,
                  method = "glm",
                  # if use prSummary then change metric "Accuracy" to "AUC", "Precision", "Recall", "F"
                  metric = "Recall", # ขึ้นอยู่กับว่าเราต้องการค่าใดให้มีค่าสูงสุด
                  trControl = ctrl) 

logistic_model

# score
p <- predict(logistic_model, newdata = test_data)

# evaluate
mean(p == test_data$diabetes)

confusionMatrix(p, # prediction
                test_data$diabetes, # actual
                positive = "pos", # pos = positive เราสนใจเป็นเบาหวาน
                mode = "prec_recall")


# Use model VS  Don't use model
## เราจะรู้ได้ไงว่า model ที่เราสร้างขึ้นดีกว่าการไม่ใช้ model หรือไม่
## ex. column diabetes ใน PimaIndiansDiabetes มี neg = 401, pos = 213, รวมกันได้ 614
## สมมุติว่าเราทำนายโดยไม่ใช้ model ว่าทั้ง 614 คนไม่เป็นโรคเบาหวาน จะได้ Accuracy = 401/614 = 0.65 = 65% เรียกว่า  baseline
## จากตัวอย่างการ train model ข้างบนเราได้ Accuracy = 75%
## แปลว่าตอนนี้การใช้ model ดีกว่าการไม่ใช่ model อยู่ 10%


# Imbalance class
## ตัวอย่างเช่น ทุก1000คนจะมีคนเป็น covid 10 คน = 10/1000 = 0.01 = 1%
## แสดงว่าคนที่ไม่เป็น covid จะมี Accuracy = 99%
## 99:1 ซึ่งไม่ make sense เพราะฉนั้นไม่แนะนำให้ใช้ Accuracy
## imbalance class จะอยู่ประมาณ 80:20, 60:40, and so on
## เราอยากได้ที่ Accuracy 50:50
## ในชีวิตจริงส่วนใหญ่เป็น  imbalance class

# วิธีดู Imbalance class
## Accuracy ต้องเยอะกว่า baseline model

# เวลาเกิด Imbalance class เราจะไม่สนใจ Accuracy 
## แต่เราจะสนใจ AUC, Precision, Recall, F แทน




 