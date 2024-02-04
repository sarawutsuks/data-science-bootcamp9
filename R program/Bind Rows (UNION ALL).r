# Bind Rows (UNION ALL)
#  bind_rows() เทียบเท่ากับการเขียน UNION ALL ใน SQL
library(dplyr)
library(readxl)

# read excel file

econ <- read_excel('students.xlsx', sheet = 1)
bussiness <- read_excel('students.xlsx', sheet = 2)
data <- read_excel('students.xlsx', sheet = 3)

# bind_rows() == Union All in SQL

bind_rows(econ, bussiness)
bind_rows(econ, bussiness, data)

 ## ถ้า data frame เยอะ ควรสร้าง list ก่อน
list_df <- list(econ, bussiness, data) 
bind_rows(list_df)
