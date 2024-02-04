# install
install.packages("dplyr")

# load package
library(dplyr)

# read csv file to Rstidio
imdb <- read.csv("imdb.csv", stringsAsFactors = FALSE) # stringsAsFactors = F คือไม่เปลี่ยน string to factor
View(imdb)
____________________________________________

# review data structure
glimpse(imdb) # ดู data type, ชื่อ column ต่างๆ  # data type = <dbl> คือเลขที่มีทศนิยม

head(imdb) # print first 6 row
head(imdb, 10) # print first 10 row
tail(imdb, 10) # print last 10 row

____________________________________________

# select column
names(imdb) # ดูชื่อ column

select(imdb, MOVIE_NAME, RATING)
select(imdb, 1, 5)

select(imdb, movie_name = MOVIE_NAME, released_year = YEAR) # change name column
___________________________________________

# pipe operator %>%  เหมือนกับการเข้า folder

## เข้าไปที่ imdb เลือก column = movie_name, relaeased_year ดึงมา 10 แถวแรก
imdb %>% 
  select(movie_name = MOVIE_NAME, released_year = YEAR) %>%
  head(10)    

## filter data
filter(imdb, SCORE >= 9.0)

## use pipe filter
imdb %>%
  filter(SCORE >= 9.0)

names(imdb) <- tolower(names(imdb))  # change name column to lower case

## ex.1
imdb %>%
  select(movie_name, year, score) %>%
  filter(score >= 9 & year > 2000)  # & = and

## ex.2
imdb %>%
  select(movie_name, length, score) %>%
  filter(score == 8.8 | score == 8.3 | score == 9) # | = or

## ex.3
imdb %>%
  select(movie_name, length, score) %>%
  filter(score %in% c(8.3, 8.8, 9.0))   # %in% = in ใน SQL

# filter strings column

## ex.1
imdb %>%
  select(movie_name, genre, rating) %>%
  filter(rating == "PG-13")

## ex.2
grepl("Drama", imdb$genre)  # หา row ที่มีคำว่า Drama อยู่ในนั้น โดยไม่สนว่าอยู่ตำแหน่งไหน

imdb %>%
  select(movie_name, genre, rating) %>%
  filter(grepl("Drama", imdb$genre))  # case sensitive

## ex.3
imdb %>%
  select(movie_name) %>%
  filter(grepl("The", imdb$movie_name)) # case sensitive
___________________________________________

# create new column use function mutate()

## ex.1 สร้าง column ใหม่ตามเงื่อนไข
imdb %>%
  select(movie_name, score, length) %>%
  mutate(score_gruop = if_else(score >= 9, "High rating", "Low rating"),
         length_group = if_else(length >= 120, "Long film", "Short film"))

## ex.2 สร้าง column ใหม่โดย column score + 0.1
imdb %>%
  select(movie_name, score) %>%
  mutate(score_update = score + 0.1) %>%
  head(10)
___________________________________________

# arrange data  use function arrange()

## ex.1
imdb %>%
  arrange(length) %>%   # default ascending order
  head(10)

## ex.2
imdb %>%
  arrange(desc(length)) %>%   # descending order
  head(10)

## ex.3 จัดกลุ่มตาม rating แล้วก็เรียง length แบบ desc
imdb %>%
  arrange(rating, desc(length))    
___________________________________________

# summarise and group by

## ex.1 หาค่าทางสถิติ จับกลุ่มตาม rating และ filter blank ออก
imdb %>%
  filter(rating != "") %>%  # remove blank
  group_by(rating) %>%   # group by col = rating
  summarise(mean_length = mean(length),
            sum_length = sum(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length),
            n = n())  # นับจำนวนค่าสังเกตตามกลุ่มของ column = rating
___________________________________________

# join data

## ex.1
 ### create new data frame
fav_flims <- data.frame(id = c(5, 10, 25, 30, 98))
fav_flims

 ### join fav_films with imdb
fav_flims %>%
  inner_join(imdb, by = c("id" = "no"))  # pk = fk
___________________________________________

# write csv file (export result)
imdb_prep <- imdb %>%
  select(movie_name, released_year = year, rating, length, score) %>%
  filter(rating == "R" & released_year > 2000)

View(imdb_prep)

## export csv
write.csv(imdb_prep, "imdb_prep.csv", row.names = F) # row.names = F คือไม่เอาเลข 1,2,3,..

## download csv file from cloud
 ### ล่างขวา > files > click csv file > more > export > download
___________________________________________
