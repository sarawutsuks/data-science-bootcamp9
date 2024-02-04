# Read table
# create student table ชื่อ r103_text
library(readr)
read_table('r103_text')  # read table ที่มี space คั่น
student <- read_table('r103_text')
View(student)
