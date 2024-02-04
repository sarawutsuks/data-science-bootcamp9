# Convert Data Types

 ## main functions
 ## as.numeric()  # chang data types to numeric
 ## as.character() # chang data types to character
 ## as.logical() # chang data types to logical

x <- 100  # ให้ x = numeric
class(x)

char_x <- as.character(x) # change x = numeric to character
num_x <- as.numeric(x) # change x = character to numeric

 ## as.logical() # logic จะมีแค่ TRUE / FALSE
as.logical(0) # 0 = FALSE
as.logical(1) # 1 = TRUE
as.numeric(TRUE) # TRUE = 1
as.numeric(FALSE) # FALSE = 0
