# load dataset
movies <- read_csv("full_movies.csv")

# clean titles without year
movie_titles <- movies$Title %>%
  str_remove("^[0-9]+\\.") %>%
  str_trim() %>%
  str_remove("\\.") %>%
  str_remove("[0-9]{4}") %>%
  str_remove_all("\\(") %>%
  str_remove_all("\\)") %>%
  str_trim()

# clean year from titles column
movies_year <- movies$Title %>% 
  str_sub(-6) %>%
  str_remove_all("\\(") %>%
  str_remove_all("\\)")

# convert type ratings from character to numeric
ratings <- as.numeric(movies$Ratings)

# clean runtimes
runtimes <- movies$Runtimes %>%
  str_remove("min")%>%
  str_trim()

# create new dataframe
full_movies <- data.frame(movie_titles, movies_year, ratings, runtimes)

# convert the dataframe to tribble for easier exploring data and change column name
imdb <- full_movies %>%
  as_tibble() %>%
  select(Title = movie_titles,
         Year = movies_year,
         Rating = ratings,
         Runtime = runtimes)

write.csv(imdb, "imdb.csv")
