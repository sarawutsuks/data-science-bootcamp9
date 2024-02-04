greeting_user <- function(){   
  user_name = readline('What is your name?: ')  #readline รับ input character
  text = paste('Good morning', user_name)  
  return(text)
}
greeting_user()
