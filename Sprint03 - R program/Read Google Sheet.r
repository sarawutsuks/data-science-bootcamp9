# Read google sheet
library(googlesheets4)
url <- "https://docs.google.com/spreadsheets/d/19nJWdrKevRzxhiJeITzLadf3QMoCpx8GP4Vxy7BZ7gk"
# ลบ /edit... ออก
gs4_deauth()  # คือ ไม่ต้อง login ไปใน sheet เพราะ link เป็น public
read_sheet(url)
