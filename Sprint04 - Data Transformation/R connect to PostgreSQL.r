# connect to PostgreSQL server
# ในที่นี้ use ElephantSQL

# load library
library(RPostgreSQL)
library(tidyverse)

# create connection
con <- dbConnect(
  PostgreSQL(), # can change other drivers (e.g., RSQLite, MySQL, PostgreSQL)
  host = "arjuna.db.elephantsql.com",  #server
  dbname = "njphkmjg",  #default database
  user = "njphkmjg",    #user database
  password = "OQn7MS6mYrH0DD_m3GQ2FG7TTkSdIR7x",
  port = 5432   # เลข port ของ postgrsSQL                               
)

# create data set and send to PostgreSQL

# create dataframe use tribble()
products <- tribble(
  ~id, ~product_name,
  1, "Pizza",
  2, "KFC",
  3, "Noddle"
)


# ! ถ้าใน PostgreSQL มีชื่อ table ซ้ำกันจะ error ต้อง remove table ก่อน

# send table products to PostgreSQL
dbWriteTable(con, "products", products)


# get data
df <- dbGetQuery(con, "select * from products")
df


# remove table บน PostgreSQL
dbRemoveTable(con, "products", products)


dbDisconnect(con)

con #check connection
