# Homework 1: 5 Questions Ask about Flights Dataset

# 1. Where are the most popular destinations in June (Top 5)?

flights %>%
  filter(month == 6) %>%
  count(dest) %>%
  arrange(-n) %>%
  head(5)

# 2. Which carriers fly to MIA most often?

flights %>%
  filter(month == 12 & origin == "JFK") %>%
  count(flight) %>%
  arrange(-n) %>%
  head(5)

# 3. How many flights from JFK are there in December?

flights %>%
  filter(month == 12 & origin == "JFK") %>%
  count(flight) %>%
  arrange(-n) %>%
  head(5)

# 4. Which flights are the fastest flight in March

flights %>%
  select(month, origin, dest, carrier, flight, air_time, distance) %>%
  mutate(fastest_flight = distance/air_time) %>%
  filter(month == 3) %>%
  arrange(fastest_flight) %>%
  head(10)

# 5. Which airlines have the longest delays in August?

flights %>%
  select(month, carrier, flight, arr_time, sched_arr_time, arr_delay) %>%
  filter(arr_delay < 0 & month == 8) %>%
  arrange(arr_delay) %>%
  head(10)
