## count_ball() 
balls <- c('green', 'green', 'red', 'red', 'yellow', 'purple', 'purple')


count_ball <- function(balls, color){  # นับสีลูกบอล
  sum(balls == color)
}

count_ball(balls, 'red')
count_ball(balls, 'yellow')
