#Chapter 3 covers working with dyplr, which is part of the tidyverse package. This code contains a selection of the different questions that the chapter contains. 
rm(list=ls())
setwd("C:/Users/31636/Desktop/R/Rfordatascience")
install.packages("nycflights13")
library(tidyverse)
library(nycflights13)
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