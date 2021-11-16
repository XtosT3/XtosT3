## Install the packages and libraries for the animation

install.packages("tidyverse")
install.packages("gganimate")
install.packages("gifski")
library(gganimate)
library(ggplot2)
library(dplyr)
library(ggthemes)
library(readr)

## Import the dataset, created from BigQuery

european_covid_cases_and_deaths <- read_csv("european_covid_cases_and_deaths.csv")


## Create the scatterplot first and then add on the animation


ggplot(data = european_covid_cases_and_deaths) +
  geom_point(aes(x = total_cases, y = total_deaths, color = location)) +
  labs(title = "European Covid_19 cases and deaths",
       x = "Total cases",
       y = "Total deaths",
       caption = "Data Source: Our World in Data") +
  transition_time(date) +
  labs(subtitle = "Date: {frame_time}") +
  shadow_wake(wake_length = 0.1)

## Save the animation

anim_save("covid cases and deaths graph.gif")
  