# house price in india prediction

# install packages
library(readxl)
library(caret)
library(tidyverse)

# import data
house_2016 <- read_excel("House Price India.xlsx", sheet = 1)
house_2017 <- read_excel("House Price India.xlsx", sheet = 2)
df <- bind_rows(house_2016, house_2017)

# preview dataset
head(df)

# data visualization
ggplot(data = df, aes(Price)) +
  geom_histogram(bins = 100,
                 fill = "salmon") +
  theme_minimal() + 
  labs(title = "Distribution of House Price India",
       x = "Price",
       y = "Frequency",
       caption = "Source: data.world")

# convert data to normal distribution
df$log_price <- log(df$Price)

# visualize data after taking logarithm
ggplot(data = df, aes(log_price)) +
  geom_histogram(bins = 50,
                 fill = "salmon") +
  theme_minimal() + 
  labs(title = "Distribution of House Price India",
       subtitle = "Take log to Normal Distribution",
       x = "Log Price",
       y = "Frequency",
       caption = "Source: data.world")

# clean data
df %>%
  complete.cases() %>%
  mean()

# select data
df <- df %>%
select("number of bedrooms", 
       "number of bathrooms", 
       "lot area", 
       "number of floors",
       "log_price")

# split data
split_data <- function(df) {
  set.seed(42)
  n <- nrow(df)
  train_id <- sample(1:n, size = 0.8*n)
  train_df <- df[train_id, ]
  test_df <- df[-train_id, ]
  return(list(training = train_df,
              testing = test_df))
}

prep_data <- split_data(df)
train_df <- prep_data$training
test_df <- prep_data$testing

# train model
lm_model <- train(log_price ~ . , 
  data = train_df, 
  method = "lm",
)
lm_model

# score data
p <- predict(lm_model, newdata = test_df)

# evaluate
(mae <- mean(abs(p - test_df$log_price)))
(rmse <- sqrt(mean((p - test_df$log_price)**2)))
