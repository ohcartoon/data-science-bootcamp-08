
# Create 5 questions about data visualization with built-in “diamonds” dataset in Rstudio

# install packages
library(ggplot2)
library(tidyverse)
library(ggthemes)

set.seed(5)
mini_diamonds <- sample_frac(diamonds, 0.3)

# Question 1: Which is the most popular diamond clarity grade?

ggplot(mini_diamonds, aes(clarity)) +
  geom_bar(fill = "#d95f0e") +
  theme_minimal() +
  labs(title = "The Most Popular Diamond Clarity Grade",
    x = "Clarity",
    y = "Number of Diamonds",
    caption = "Source: The Built-in Diamonds Dataset in Rstudio")

# Question 2: Create a chart showing the relationship between color and price

ggplot(mini_diamonds, aes(color, price)) +
  geom_boxplot(fill = "#fec44f") +
  theme_minimal() +
  labs(title = "Relationship between Color and Price",
    x = "Color",
    y = "Price",
    caption = "Source: The Built-in Diamonds Dataset in Rstudio")

diamonds %>%
  group_by(color) %>%
  summarize(avg_color_price = mean(price),
  med_color_price = median(price))

# Question 3: Create a chart showing the distribution of diamond cut

ggplot(mini_diamonds, aes(cut, price)) + 
  geom_boxplot(fill = "#fff7bc") +
  theme_minimal() +
  labs(title = "Relationship between Cut and Price",
    x = "Cut",
    y = "Price",
    caption = "Source: The Built-in Diamonds Dataset in Rstudio")

diamonds %>%
  group_by(cut) %>%
  summarize(avg_cut_price = mean(price),
  med_cut_price = median(price))

# Question 4: Create a chart showing the relationship between diamond carat weight and diamond price

ggplot(mini_diamonds, 
       aes(x = carat, y = price, col = price)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", col = "black") + 
  theme_minimal() +
  scale_color_gradient(
    low = "#fff7bc", 
    high = "#d95f0e") +
  labs(
    title = "Relationship between Diamond Carat Weight and Diamond Price",
    x = "Carat",
    y = "Price",
    caption = "Source: The Built-in Diamonds Dataset in Rstudio")

# Question 5: Create the chart showing the relationship between carat, color, clarity, and price

ggplot(mini_diamonds, 
       aes(x = carat, y = price, col = color)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", col = "black", linewidth = 0.5) + 
  theme_minimal() +
  facet_wrap(~clarity, ncol = 2) +
  scale_color_brewer(type = "seq",
                     palette = 8) +
  labs(title = "Relationship between Carat, Color, Clarity and Price",
       x = "Carat",
       y = "Price",
       caption = "Source: The Built-in Diamonds Dataset in Rstudio")

