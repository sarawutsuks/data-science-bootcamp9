# Numeric
age <- 24
print(age)
class(age

# Character
my_name <- 'Arm'
my_university <- 'KU'
print(my_name)
print(my_university)
class(my_name)
class(my_university)


# logical(TRUE, FALSE)
result <- 1 + 1 == 2
print(result)
class(result)
class(TRUE)
class(T)
class(F)
1 + 1 == 2
2-2 > 0
!(2-2 > 0) # ! นิเสธ
'HELLO' == 'Hello'

# factor
animal <- c("dog", "cat", "fish", "tiger")
class(animal)
animal <- factor(animal)  #change text to factor
class(animal)
print(animal)


# (date / time) == "POSIXct
time_now <- Sys.time() # function sys.time() บอกเวลาปัจจูบัน
print(time_now)
class(time_now)
      
