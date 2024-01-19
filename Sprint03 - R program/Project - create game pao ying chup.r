game_pao_ying_chup <- function(){
  # variable
  choice <- c("hammer", "scissor", "paper")
  round <- 0
  win <- 0
  draw <- 0
  loss <- 0
  
  while (TRUE) {
    user <- readline("You: ")  # input
    # if user กรอกที่มีใน choice ค่า x = 1
    x <- ifelse(user == choice, 1, 0) 
    if (sum(x) == 1){
      com <- sample(choice, 1) 
      if (com == user) {
        print(paste("Com = ", com))
        print("Result: draw!")
        draw = draw + 1
        round = round + 1
      } else {
        if (com == "hammer"){              # com win
          if(user == "scissor"){   
            print(paste("Com = ", com))
            print("Result: You lost")
            loss = loss + 1  
            round = round + 1
          } else {                        # user win
            print(paste("Com = ", com))
            print("Result: You win")
            win = win + 1
            round = round + 1
          }
        } else if (com == "scissor") {
          if(user == "paper"){         
            print(paste("Com = ", com))
            print("Result: You lost")
            loss = loss + 1
            round = round + 1
          } else {
            print(paste("Com = ", com))
            print("Result: You win")
            win = win + 1
            round = round + 1
          }
          
        } else if (com == "paper") {
          if(user == "hammer"){   
            print(paste("Com = ", com))
            print("Result: You lost")
            loss = loss + 1
            round = round + 1
          } else {
            print(paste("Com = ", com))
            print("Result: You win")
            win = win + 1
            round = round + 1
          }
        }
      }
    } else {
          # check
          check <- readline("Are you want to exit the game? [yes / no]:")
          if (check == "yes"){
            # print result
            print(paste("Total round:", round))
            print(paste("win:", win))
            print(paste("draw:", draw))
            print(paste("loss:", loss))
            break
          } 
    }
  }
}   

      
