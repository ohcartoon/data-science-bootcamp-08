## Connect to SQL Server (PostgreSQL)
library(RPostgreSQL)
library(tidyverse)

## [1] Connect Database
con <- dbConnect(PostgreSQL(), 
                 host = "arjuna.db.elephantsql.com",
                 port = 5432,
                 user = "gnepdxwg",
                 password = "DRqfMdF2-H2gObfvc3iEydLUcXADGJ9v",
                 dbname = "gnepdxwg")

## [2] Create Dataframe

# customers
customers <- data.frame(
  id = 1:5,
  name = c("Lisa", "Jisoo", "Rose", "Jennie", "Minnie"),
  city = c("Bangkok", "South Korea", "Australia", "New Zealand", "Bangkok")
)

# topping
topping <- data.frame(
  no = 1:5,
  topping = c("Double Cheese", "Ham & Crab Sticks",
              "Hawaiian", "Seafood Cocktail", 
              "Seafood Deluxe"),
  price = c("299", "339", "379", "439", "439")
)

# crust
crust <- data.frame(
  no = 1:4,
  crust = c("Crispy Thin Medium", "Pan Medium", 
            "Extreme Cheese Medium", 
            "Extreme Sauage & Cheese"),
  charge = c("0", "50", "100", "100")
)

# size
size <- data.frame(
  no = 1:3,
  size = c("S", "M", "L"),
  charge = c("0", "100", "150")
)

# ingredients
ingredients <- data.frame(
  no = 1:9,
  ingredients = c("No add", "Onions", "Mushrooms",
                  "Pineapple", "Mozzarella Cheese", 
                  "Sliced Bacon", "Pepperoni", "Prawn", 
                  "Seafood Mix"),
  charge = c("0", rep("49", 3), rep("59", 3), rep("79", 2))
)

## transaction
transaction <- data.frame(
  date = c("2023-06-17", "2023-06-18", "2023-06-19", 
           "2023-06-19", "2023-06-19"),
  customer_id = 1:5,
  trans_id = 1:5,
  topping = c("Hawaiian", "Double Cheese", "Seafood Cocktail", 
              "Seafood Cocktail", "Seafood Cocktail"),
  crust = c("Pan Medium", "Crispy Thin Medium", 
            "Crispy Thin Medium", "Crispy Thin Medium", "Pan Medium"),
  size = c("S", "S", "S", "M", "L"),
  ingredients = c("Pineapple", "No add", "No add", 
                  "No add", "Mozzarella Cheese")
)

## [3] Write new table in database
dbWriteTable(con, "customers", customers)
dbWriteTable(con, "topping", topping)
dbWriteTable(con, "crust", crust)
dbWriteTable(con, "size", size)
dbWriteTable(con, "ingredients", ingredients)
dbWriteTable(con, "transaction", transaction)

## [4] List Tables
dbListTables(con)

## [5] Query Data
dbGetQuery(con, "select * from transaction where date = '2023-06-19'")
dbGetQuery(con, "select * from ingredients where charge >= '59'")
dbGetQuery(con, "select * from topping where topping like 'S%'")

## [6] Remove Tables
dbRemoveTable(con, "customers")
dbRemoveTable(con, "topping")
dbRemoveTable(con, "crust")
dbRemoveTable(con, "size")
dbRemoveTable(con, "ingredients")
dbRemoveTable(con, "transaction")

## [7] Disconnect from Database
dbDisconnect(con)
