# Read Excel
# > library(realexl)
# > read_excel('students.xlsx', sheet = 1)

# เขียน loop ดึงข้อมูลจาก excel จาก หน้า 1 ถึง 3

result <- list()

for (i in 1:3) {
  result[[i]] <- read_excel('students.xlsx', sheet = i)
}

result[[1]] # sheet1
result[[2]] # sheet2
result[[3]] # sheet3
