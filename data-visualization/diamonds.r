---
title: "Data Visualization Bootcamp Homework"
author: "Cartoon Tanaporn"
date: "2023-07-04"
output:
  pdf_document: default
  html_document: default
---
## Introduction
This assignment is designed for Data Science Bootcamp Batch 8 presented by DataRockie.

**Instruction:** Create 5 questions about data visualization with built-in “diamonds” dataset in Rstudio

### Required Packages in Rstudio
Before creating effectively data visualizations, we have to install packages:

* The ***ggplot2*** is a system for declaratively creating graphics, based on The Grammar of Graphics
*  The ***tidyverse*** is a set of packages that work in harmony because they share common data representations and 'API' design
* The ***ggthemes*** package provides extra themes, geoms, and scales for the ggplot2 package.

```{r}
library(ggplot2)
library(tidyverse)
library(ggthemes)
```

#### Notes
Since the built-in "diamonds" dataset has more than **50,000 records**, so we randomly took **30%** of the dataset before creating data visualizations.

```{r}
set.seed(5)
mini_diamonds <- sample_frac(diamonds, 0.3)
```


### Question 1: Which is the most popular diamond clarity grade?

```{r}
ggplot(mini_diamonds, aes(clarity)) +
  geom_bar(fill = "#d95f0e") +
  theme_minimal() +
  labs(title = "The Most Popular Diamond Clarity Grade",
    x = "Clarity",
    y = "Number of Diamonds",
    caption = "Source: The Built-in Diamonds Dataset in Rstudio")
```
#### Conclusion
According to the bar chart, the most popular diamond clarity grades are SI1, VS2, and SI2 respectively.

### Question 2: Create a chart showing the relationship between color and price

```{r}
ggplot(mini_diamonds, aes(color, price)) +
  geom_boxplot(fill = "#fec44f") +
  theme_minimal() +
  labs(title = "Relationship between Color and Price",
    x = "Color",
    y = "Price",
    caption = "Source: The Built-in Diamonds Dataset in Rstudio")
```

```{r}
diamonds %>%
  group_by(color) %>%
  summarize(avg_color_price = mean(price),
  med_color_price = median(price))
```

#### Conclusion
The box plot and average color price and median color price table show that diamond colors have an influence on the diamond price, as the following color levels: J > I > H > G > F > D > E. The better color, the higher diamond price.

### Question 3: Create a chart showing distribution of diamond cut

```{r}
ggplot(mini_diamonds, aes(cut, price)) + 
  geom_boxplot(fill = "#fff7bc") +
  theme_minimal() +
  labs(title = "Relationship between Cut and Price",
    x = "Cut",
    y = "Price",
    caption = "Source: The Built-in Diamonds Dataset in Rstudio")
```

```{r}
diamonds %>%
  group_by(cut) %>%
  summarize(avg_cut_price = mean(price),
  med_cut_price = median(price))
```

#### Conclusion
The box plot and the average cut price show that diamond cuts have no obvious influence on the diamond price. We assumed that there are other factors that definitely affect to the diamond price.

### Question 4: Create a chart showing the relationship between diamond carat weight and diamond price

```{r}
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
```

#### Conclusion
According to the chart, a positive trend line tells us the scatter plot has a positive correlation. This means that the greater the diamond carat weight, the higher the diamond price. 

However, the diamond carat weight between 1 and 3 concentrated at the same price. We therefore assume that there are other factors that influence the diamond price, besides diamond carat weight, such as cutting, color, clarity of diamonds.

### Question 5: Create the chart showing relationship between carat, color, clarity and price

```{r}
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
```
#### Conclusion
The scatter plot shows that relationship between carat, clarity and price is positive according to the trend line. We can observe that the more great carats, the higher the price of diamonds. 

Plus, the D color appears mostly in small carat weight diamonds (< 1.5 carat), while the J color is the usually only found in large carat weight diamonds and also the most expensive diamonds in every range of clarity.

As mentioned in the paragraphs above, carat, color and clarity all affect to the diamond price.

