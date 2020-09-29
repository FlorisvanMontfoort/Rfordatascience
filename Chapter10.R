#Chapter 10 'Relational data'
library(tidyverse)
library(nycflights13)
#The line below shows that flight does not uniquely identify a flight on a certain day. 
flights %>% count(year, month, day, flight) %>% filter(n > 1)
#Therefore I add a flight ID to each flight.
flights %>% arrange(year, month, day, sched_dep_time, carrier, flight) %>% mutate(flight_id = row_number()) %>% glimpse()
#Questions
average_delay_destination <- flights %>% ungroup() %>% group_by(dest) %>% summarize(average_delay = ((mean(arr_delay, na.rm = TRUE) + mean(dep_delay, na.rm = TRUE))/2), n = n())
map_delay <- average_delay_destination %>% left_join(airports, by = (c("dest" = "faa"))) %>% filter(n > 50 & lon >= -140)
ggplot(map_delay, aes(lon, lat,)) + borders("state") + geom_point(aes( size = average_delay)) + coord_quickmap()
#Question 2
question2 <- flights %>% left_join(airports, c("dest" = "faa")) %>% rename(lat_dest = lat, lon_dest = lon) %>% left_join(airports, c("dest" = "faa")) %>% rename(lat_origin = lat, lon_origin = lon) %>% select(year:time_hour, lat_dest, lon_dest, lat_origin, lon_origin)
#Question 3 
planes2 <- planes %>% rename(built_year = year)
flights2 <- flights %>% left_join(planes2, select(tailnum, built_year), by = "tailnum") %>% mutate(age_plane = year - built_year) %>%  filter(!is.na(age_plane)) %>% group_by(age_plane) %>% summarise(arr_delay_age = mean(arr_delay, na.rm = TRUE))
#Question 6 uses distinct 
planes_carriers <- flights %>% filter(!is.na(tailnum)) %>% distinct(tailnum, carrier) %>% group_by(tailnum) %>% filter(n() > 1) %>% left_join(airlines, by = "carrier") %>% arrange(tailnum, carrier)