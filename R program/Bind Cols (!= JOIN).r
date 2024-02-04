# Bind Cols (คือการเอา data frame มาวางต่อกัน ซ้าย-ขวา)
# Bind Cols ไม่เท่ากับการ Join table เพราะไม่มี Key


 ## rep การทำซ้ำ
df1 <- data.frame(id = 1:5,
                  name = c('Arm', 'Jing', 'Thitavee', 'Parn', 'Aheye'))

df2 <- data.frame(city = c(rep('BKK',3), rep('LA', 2)),
                  country = c(rep('TH', 3), rep('UK', 2)))

bind_cols(df1, df2)
bind_cols(df2, df1)
_________________________________________________

# ex. Left Join

df1 <- data.frame(id = 1:5,
                  name = c('Arm', 'Jing', 'Thitavee', 'Parn', 'Aheye'))

 
 ## ใส่ id ใน df2 เพื่อ join กับ df1
df2 <- data.frame(city = c(rep('BKK',3), rep('LA', 2)),   
                  country = c(rep('TH', 3), rep('UK', 2)),
                  id = 1:5)   

(left_join(df1, df2, by = 'id'))  # left join ใช้ id เป็น key
