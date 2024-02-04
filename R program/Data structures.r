# Vector (single data type)
1:10
16:25
seq(from = 0, to = 100, by = 5) # สร้างเลข 0 ถึง 100 โดยเพิ่มขึ้นทีละ 5
help('seq')  # help

 ## 1 vector เก็บได้ 1 type เท่านั้น
friend <- c("A", "B", "C", "D")
age <- c(25, 17, 19 , 66)
sex <- c(TRUE, FALSE, TRUE, FALSE)


# Matrix
x <- 1:25
length(x) # นับจำนวน
dim(x) <- c(5,5)  # create c(Row,Column)

m1 <- matrix(1:25, ncol = 5) # create matrix 5 column ตั้งแต่เลข 1 ถึง 25
m2 <- matrix(1:6, ncol = 3, nrow = 2, byrow = T) # create matrix 3x2 / byrow = T คือ เรียงเลขตามแนวนอน

 ## element wise computation
m1 * 2 # vectorization
m2 * 0


# List
my_name <- 'Arm'
my_age <- 24
my_gender <- TRUE  # TRUE = male (ชาย)
my_fav_movie <- c('Meg1', 'Meg2', 'Harry Potter')

my_info <- list(item1 = my_name,  # function list จะทำการรวม
                item2 = my_age,
                item3 = my_gender,
                item4 = my_fav_movie)

my_info$item1 # $ = select column
my_info$item2


# Data Frame

 ## 1. Create Data Frame by using data.frame

friend <- c('A', 'B', 'C', 'D', 'E')
age <- c(20, 15, 27, 68, 90)
gender <- c(TRUE, FALSE, FALSE, FALSE, TRUE) # true = male, false = female
location <- c('THA', 'USA', 'KOR', 'JPN', 'RUS')

data_friend <- data.frame(friend,
           age,
           gender,
           location)

View(data_friend)
