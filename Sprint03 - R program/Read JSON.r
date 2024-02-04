# Read JSON = JavaScript Object Notation (สร้าง json จะใช้ double qoute)
library(jsonlite)
fromJSON("r103_json.json")
data <- fromJSON("r103_json.json")
data.frame(data)

# หรือเขียนได้ใน 1 บรรทัด
data <- data.frame(fromJSON("r103_json.json"))
