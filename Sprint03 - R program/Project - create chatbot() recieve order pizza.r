
pizza_order_online <- function(){
  
  # list price
  
  # size price
  size_price <- list(
    personal = 1,
    small = 2,
    medium = 5,
    large = 7,
    family = 10
  )
  
  # crust price
  crust_price <- list(
    classic = 2,
    crispy = 3, 
    chicago = 5
  )
  
  # toppings price
  topping_price <- list(
    pepperoni = 2,
    sausage = 3,
    mushroom = 2,
    peppers = 2,
    onions = 1
  )
  
  total_price <- 0  
  
  # chat bot
  
  # greeting
  print("Pizza Bot: Welcome to Arm’s Pizza automates order")
  
  # name
  name <- readline("You: What is your name? ")
  print(paste("Pizza Bot: Hi", name))
  
  # address
  address <- readline("You: Please enter your delivery address ")
  
  # order pizza
  print("Pizza Bot: Great! Let's start")
  print("Pizza Bot: We have personal 1$, small 2$, medium 5$, large 7$, and family-sized pizzas 10$")
  size <- readline("You: What size tempts your taste buds today? ")
  total_price <- total_price + size_price[[size]]
  
  
  print("Pizza Bot: Excellent choice! Now, onto the crust.")
  print("Pizza Bot: We have classic 2$, crispy 3$, or chicago 5$")
  crust <- readline("You: ")
  total_price <- total_price + crust_price[[crust]]
  
  print("Pizza Bot: onto the Toppings")
  print("Pizza Bot: We have all the classics: pepperoni 2$, sausage 3$, mushrooms 2$, peppers 2$, onions 1$")
  topping <- readline("You: what are your must-haves? ")
  total_price <- total_price + topping_price[[topping]]
  
  
  # confirm order
  print("Pizza Bot: Thank you for your order!")
  print("Pizza Bot: Let's recap your Pizza")
  print(paste("Customer_name: ", name))
  print(paste("Delivery_address: ", address))
  print(paste("Order: A", size, "Pizza and", crust, "with ", topping))
  print(paste("Total price: ", total_price, "$"))
}
