# subset 1 dimension (1มติ)

friend <- c('A', 'B', 'C', 'D', 'E')
age <- c(20, 15, 27, 68, 90)
gender <- c(TRUE, FALSE, FALSE, FALSE, TRUE) # true = male, false = female
location <- c('THA', 'USA', 'KOR', 'JPN', 'RUS')

friend[1]
friend[2]
friend[1:5]
friend[0:4]
friend[ c(1,3,5)]

age[age > 30]
age[age <= 30]

names(age) <- friend  # ทำการ link age ไปใส่ใน friend
age
age[ c('D', 'A')]



# subset 2 dimension (2มติ)

friend <- c('A', 'B', 'C', 'D', 'E')
age <- c(20, 15, 27, 68, 90)
gender <- c(TRUE, FALSE, FALSE, FALSE, TRUE) # true = male, false = female
location <- c('THA', 'USA', 'KOR', 'JPN', 'RUS')

my_firend_list <- list(firend = friend,  #create list
                       age = age,
                       gender = gender,
                       location = location)

data_friend <- data.frame(my_firend_list)
View(data_friend)

data_friend[3, 2]  # data_friend[Row, Column]
data_friend[1:2, 4]
data_friend[1:2, 2:4]
data_friend[ , 'location'] # ดึงมาทุก Row ที่ Column = gender
data_friend[ , c('age', 'location')]


# subset with condition
# filter Row
data_friend[ data_friend$gender == TRUE, ] # ดึงมาทุก column ที่ gender = TRUE (male) 
data_friend[ data_friend$age > 30, ]
data_friend[ data_friend$firend == 'A', ] # ดึงทุก column ที่ Row friend = A
