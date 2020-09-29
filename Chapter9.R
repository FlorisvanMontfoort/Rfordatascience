#This script contains the exercises of Chapter 9 "Tidy Data with tidyr"
#The chapter provides a few tables which are not always tidy. Gathering and spreading are useful functions to transform them into tidy datasets. 
table4a
table4b 
#Gather: first two arguments specify the columns that are actually values. Key gives these new values a column name. Old values are allocated to a a new column. 
tidy4a <- table4a %>% gather(`1999`, `2000`, key = "year", value = "cases") 
tidt4b <- table4b %>% gather(`1999`, `2000`, key = "year", value = "population")
#We can combine the tibbles as follows. Duplicate columns are removed. 
left_join(tidy4a, tidy4b)