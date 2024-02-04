score <- 56 # ให้ score = 56
 
if (score >= 80) {
  print('Passed')
} else{
  print('failed')
}


# multiple if
score <- 56

if (score >= 90){
  print('A')
} else if (score >= 50) {
  print('D')
} else {
  print('F')
}


ifelse(score >= 80, 'pass', 'fail')
ifelse(score >= 90, 'pass', ifelse(score >= 50, 'ok', 'grade F'))
