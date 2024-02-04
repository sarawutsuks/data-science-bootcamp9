# SQL

library(sqldf)
library(readr)

school <- read_csv('school.csv')

sqldf('select * from school;')

sqldf('select 
      avg(student),
      sum(student)
      from school;')


sql_countryUSA <- "select * from school 
                   where lower(country) = 'usa';" 
sqldf(sql_countryUSA)
