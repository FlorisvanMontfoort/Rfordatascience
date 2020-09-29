#This code works through chapter 7 "Tibbles with tibble" 
library(tidyverse)
#Here I illustrate the difference between a dataframe mtcars and a tibble mtcars2 
mtcars
mtcars2 <- as_tibble(mtcars)
mtcars2
