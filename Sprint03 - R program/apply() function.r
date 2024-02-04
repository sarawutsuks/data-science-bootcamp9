# calculate_mean_by_col

calculate_mean_by_col <- function(df) {
  for (i in 1:ncol(df)) {
    print (names(df)[i])
    print(mean(df[[i]]))
  }
}

calculate_mean_by_col(USArrests)
calculate_mean_by_col(mtcars) # calculate_mean_by_col(mtcars) = apply(mtcars, MARGIN = 2, mean)

avg_by_row_mtcars <- apply(mtcars, MARGIN = 1, mean)   
# argument ตัวที่1 คือ dataset
# argument ตัวที่2 คือ margin = 1 คือ by row (= 2 คือ by col)
# argument ตัวที่3 คือ สิ่งที่เราต้องการหา

# apply() ใช้เขียนแทน loop ได้ทั้ง column, row

calculate_mean_by_col(mtcars)  # calculate_mean_by_col(mtcars) = apply(mtcars, MARGIN = 2, mean)

apply(mtcars, MARGIN = 2, mean)   # margin = 2 คือ by column

avg_by_row_mtcars <- apply(mtcars, MARGIN = 1, mean)   # margin = 1 คือ by row
avg_by_row_mtcars[1:10]  # subset ดึงมา 10 row
View(mtcars)

apply(mtcars, MARGIN = 2, sum)
apply(mtcars, MARGIN = 2, sd) 
apply(mtcars, MARGIN = 2, median)
