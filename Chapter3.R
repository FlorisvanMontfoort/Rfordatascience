#Chapter 3 covers working with dyplr, which is part of the tidyverse package. This code deals with a selection of the different questions that the chapter contains. 
rm(list=ls())
setwd("C:/Users/31636/Desktop/R/Rfordatascience")
install.packages("nycflights13")
library(tidyverse)
library(nycflights13)
#First I convert the dataset to a tibble so it prints nicely 
nycflights <- as_tibble(nycflights13::flights)
#The first set of questions deal with the filter function
question1a <- filter(flights, arr_delay>=120)
question1b <- filter(flights, dest=="HOU" | dest=="IAH")
question1e <- filter(flights, dep_delay<=0, arr_delay>120)missing <- filter(flights, is.na(dep_time))
question1f <- filter(flights, dep_delay>=60, arr_delay<dep_delay-30)
question3 <- filter(flights, is.na(dep_time))
#The second set of questions deal with the arrange function.
#I skipped these questions after playing around with the arrange function.
#The third set of questions deal with the select function.
question1select <- select(flights, starts_with(dep_), starts_with(arr_))
question1select <- select(flights, starts_with("dep_"), starts_with("arr_"))
question1select1 <- select(flights, dep_time, dep_delay, arr_time, arr_delay)
question1select2 <- select(flights, ends_with("_time"), ends_with("_delay"), -contains("air"), -contains("sched"))
rename(question1select1, florisiscool = dep_time)
test_any_of <- select(flights, anyof(c("dep_time", "deptime", "bla bla", "year", "yearj")))
#Set of questions dealing with mutate
tijden <- transmute(flights, dep_time, hour = dep_time %/% 100, minute = dep_time %% 100, minutes_since_midnight = (hour*60) + minute)
tijden <- mutate(tijden, air_time = (arr_hour - dep_hour)*100 + (arr_minute - dep_minute))
#Group-by and the pipe
not_cancelled <- flights %>% filter(!is.na(dep_delay), !is.na(arr_delay))
not_cancelled %>% group_by(year, month, day) %>% summarize(avg_delay1 = mean(arr_delay), avg_delay2 = mean(arr_delay[arr_delay>0]))