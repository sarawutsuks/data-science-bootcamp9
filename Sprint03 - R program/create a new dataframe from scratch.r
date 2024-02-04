# create a new dataframe from scratch

df <- data.frame(
id = 1:5,
name = c('Arm', 'Jing', 'Parn', 'Prin', 'Thitavee'),
age = c(24, 23, 26, 26, 25),
gender = c(T, F, F, F, F)
)

 ## create a new column
df$city <- c(rep("BKK", 3), rep('CHN', 2)) # add column city / rep คือการทำซ้ำ
df

 ## remove column
df$city <- NULL # แทนค่า NULL ใน column city
df
