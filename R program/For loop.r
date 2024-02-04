# for

friends <- c('Arm', 'Boss', 'Jay', 'Man')

for (myfriend in friends) {
  print(myfriend)                  # ตรง myfriend ตั้งชื่ออะไรก็ได้
}

for (myfriend in friends) {
  print(paste('Hi', myfriend))  # paste คือเอาคำว่า Hi ไปติดกับ myfriend
}
