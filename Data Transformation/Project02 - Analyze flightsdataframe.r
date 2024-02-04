view(flights)

# Question1
q1 <- "มีจำนวน flight เท่าไหร่ที่เดินทางตรงเวลาและถึงตรงเวลา"

a1 <- flights %>%
  select(dep_delay, arr_delay) %>%
  mutate(n_not_delay = if_else(dep_delay & arr_delay == 0, 1, 0)) %>%
  summarise(sum(n_not_delay, na.rm = T))

glue("Question: {q1} 
      Answer: {a1}")

#___________________________________________________

# Question2
q2 <- "สายการบินใด delay บ่อยที่สุดใน และ delay กี่ครั้ง"

a2 <- flights %>%
  select(carrier, dep_delay, arr_delay) %>%  
  mutate(check_delay = if_else(dep_delay | arr_delay != 0, 1, 0)) %>%
  group_by(carrier) %>%
  summarise(n_delay = sum(check_delay, na.rm = T)) %>%
  arrange(desc(n_delay)) %>%
  head(1)

view(a2)

glue("Question: {q2} 
      Answer: สายการบิน {a2[1]} มีจำนวน delay ทั้งหมด {a2[2]}")

#___________________________________________________

# Question3
q3 <- "เดือนใดวันใดที่ มีจำนวนไฟล์บินมากที่สุด"

a3 <- flights %>%
  select(month, day) %>%
  group_by(month, day) %>%
  summarise(count_flight = n()) %>%
  arrange(desc(count_flight)) %>%
  head(1)
  

glue("Question: {q3} 
      Answer: day {a3[2]} month {a3[1]}")

#___________________________________________________

# Question4
q4 <- "4.1 ในปี 2013 แต่ละสายการบิน มีจำนวนไฟล์บินทั้งหมดเท่าไหร่

, 4.2 มีจำนวน flight ที่ delay กี่ flight และไม่ delay กี่ flight

, 4.3 มีจำนวนระยะทางรวมกี่ km"


a4.1 <- flights %>%
  select(airlines_name = carrier, dep_delay, arr_delay) %>%
  group_by(airlines_name) %>%
  summarise(n_flight = n())

view(a4.1)

a4.2 <- flights %>%
  select(airlines_name = carrier, dep_delay, arr_delay) %>%
  mutate(not_delay = if_else(dep_delay & arr_delay == 0, 1, 0)) %>%
  group_by(airlines_name) %>%
  summarise(n_not_delay = sum(not_delay, na.rm = T),
            n_delay = n() - n_not_delay) 

view(a4.2)


a4.3 <- flights %>%
  select(airlines_name = carrier, distance) %>%
  mutate(distance_km = distance * 1.60934,) %>% # 1 miles = 1.60934 km
  group_by(airlines_name) %>%
  summarise(total_distance_km = sum(distance_km))

view(a4.3)
  
  

#___________________________________________________

# Question5
q5 <- "ในปี 2013 สายการบินใดที่ มี % ที่จะไม่ delay มากที่สุด"


a5 <- flights %>%
  select(airlines_name = carrier, dep_delay, arr_delay) %>%
  mutate(not_delay = if_else(dep_delay & arr_delay == 0, 1, 0)) %>%
  group_by(airlines_name) %>%
  summarise(n_not_delay = sum(not_delay, na.rm = T),
            n_delay = n() - n_not_delay,
            percent = (round((n_not_delay / n_delay) * 100, 2))) %>%
  arrange(desc(percent)) %>%
  head(1)
  
view(a5)

glue("Question: {q5}
      Answer: สายการบิน {a5[1]} {a5[4]}%")


#___________________________________________________
