# Pizza Restaurant Order

# df topping
topping <- data.frame(
  no = 1:5,
  topping = c("Double Cheese", "Ham & Crab Sticks", "Hawaiian", 
              "Seafood Cocktail", "Seafood Deluxe"),
  price = c("299", "339", "379", "439", "439")
)

# df crust
crust <- data.frame(
  no = 1:4,
  crust = c("Crispy Thin Medium", "Pan Medium", 
            "Extreme Cheese Medium", "Extreme Sauage & Cheese"),
  charge = c("0", "50", "100", "100")
)

# df size
size <- data.frame(
  no = 1:3,
  size = c("S", "M", "L"),
  charge = c("0", "100", "150")
)

# df ingredients
ingredients <- data.frame(
  no = 1:9,
  ingredients = c("No add", "Onions", "Mushrooms",
                 "Pineapple", "Mozzarella Cheese", "Sliced Bacon",
                 "Pepperoni", "Prawn", "Seafood Mix"),
  charge = c("0", rep("49", 3), rep("59", 3), rep("79", 2))
)

pizza_ordering <- function(){
  
  print("Welcome to Rockie Pizza!")
  print("Please select topping, crust and size of pizza!")
  cat("-------------------------------------------------------\n")

  topping_list <- c()
  crust_list <- c()
  size_list <- c()
  ing_list <- c()
  
  topping_price <- 0
  crust_price <- 0
  size_price <- 0 
  ing_price <- 0
 
  ## select topping
  cat("\nTopping\n\n")
  print(topping)
  while(TRUE){
    cat("\nSelect Topping (Select number): ")
    selected_topping <- readLines("stdin", n = 1)

    if(selected_topping %in% topping$no){
      topping_list <- c(topping_list, topping$topping[topping$no == selected_topping])
      topping_price <- as.numeric(topping$price[topping$no == selected_topping])
      cat("--------------------------------------------------\n")
      break
    } else {
      print("Please Select Topping by Number")
      cat("--------------------------------------------------\n")
    }   
  }

  ## select crust
  cat("\nCrust\n\n")
  print(crust)
  while(TRUE){
    cat("\nSelect Crust (Type Number): ")
    selected_crust <- readLines("stdin", n = 1)

    if(selected_crust %in% crust$no){
      crust_list <- c(crust_list, crust$crust[crust$no == selected_crust])
      crust_price <- as.numeric(crust$charge[crust$no == selected_crust])
      cat("--------------------------------------------------\n")
      break
    } else {
      print("Please Select Crust by Number")
      cat("--------------------------------------------------\n")
    }   
  }

  ## select size
  cat("\nSize\n\n")
  print(size)
  while(TRUE){
    cat("\nSelect Size (Type Number): ")
    selected_size <- readLines("stdin", n = 1)

    if(selected_crust %in% size$no){
      size_list <- c(size_list, size$size[size$no == selected_size])
      size_price <- as.numeric(size$charge[size$no == selected_size])
      cat("--------------------------------------------------\n")
      break
    } else {
      print("Please Select Size by Number")
      cat("--------------------------------------------------\n")
      break
    }   
  }

  ## select ingredients
  cat("\nIngredients\n\n")
  
  print(ingredients)
  while(TRUE){
    cat("\nSelect Ingredients (Type Number): ")
    selected_ingredients <- readLines("stdin", n = 1)

    if (selected_ingredients %in% ingredients$no){
      ing_list <- c(ing_list, ingredients$ingredients[ingredients$no == selected_ingredients])
      ing_price <- as.numeric(ingredients$charge[ingredients$no == selected_ingredients])
      cat("--------------------------------------------------\n")
      break
    } else {
      print("Please Select Ingredients by Number")
      cat("--------------------------------------------------\n")
    }   
  }
 
  # confirm your order
  cat("\nConfirm your order\n\n")
  
  print(paste("Topping: ", topping_list))
  print(paste("Crust: ", crust_list))
  print(paste("Size: ", size_list))
  print(paste("Ingredients: ", ing_list))

  total_price <- topping_price + size_price + crust_price + ing_price

  ## total price
  print(paste("Total price: ", total_price, " Baht"))
  cat("\nDo you want to confirm this order (Y/N): ")

  while(TRUE){
    confirm_order <- readLines("stdin", n = 1)
    
    if(confirm_order == "Y" | confirm_order == "y"){
      print("Thank you for visiting Rockie Pizza!")
      print("Bon Appétit!")
      break
    } else if (confirm_order == "N" | confirm_order == "n") {
      cat("\nDo you want to order pizza again? (Y/N): ")
      break
    } else {
      cat("\nPlease select (Y/N): ")
    }
  }

  while(TRUE){
    order_again <- readLines("stdin", n = 1)
    if(order_again == "Y" | order_again == "y"){
      pizza_ordering()
      break
    } else if(order_again == "N" | order_again == "n"){
      print("Thank you for visiting Rockie Pizza!")
      break
    } else {
      cat("\nPlease select (Y/N): ")
      order_again <- readLines("stdin", n = 1)
      break
    }
  }
}

pizza_ordering()


