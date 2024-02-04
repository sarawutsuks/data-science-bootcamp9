---
title: "Homework_Rmarkdown"
author: "Arm"
date: "2024-01-04"
output: html_document
---

## Create Rmarkdown and 5 chart use data set **`mpg`**

<br>

### load library

```{r, message= FALSE}
library(tidyverse)
library(ggplot2)
library(ggthemes)
```
 
<br>

### review data

```{r}
glimpse(mpg)
```

<br>

|  Column      |    Meaning   |
|--------------|--------------|
| manufacturer | manufacturer name |
| model        | model name       |
| displ        | engine displacement, in liters|
| year         | year of manufacture           |
| cyl          | number of cylinders           |
| trans        | type of transmission          |  
| drv          | the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd           |
| cty          | city miles per gallon         |
| hwy          | highway miles per gallon      |
| fl           | fuel type                     |
| class        | type of car                   |

<br>

### histogram

```{r}
ggplot(mpg, aes(cty)) + 
  geom_histogram(binwidth = 5)
```

<br>

### bar chart

```{r}
bar <- mpg %>%
  count(manufacturer) %>%
  ggplot(aes(x = reorder(manufacturer, n), y = n, fill = manufacturer))

bar + geom_bar(stat = 'identity') +
  coord_flip() +
  labs(title = "Manufacturer vs. Number of cars",
       x = "Manufacturer",
       y = "Number of cars",
       caption = "data set: mpg")
```

<br>

### Scatter plot

```{r message=FALSE, warning=FALSE}
scatter1 <- ggplot(mpg, mapping = aes(x = displ, y = hwy, color = class))
 
scatter1 +  geom_point(alpha = 0.8) + 
   theme_light() + 
   geom_smooth(method = lm, color = "red") +
   labs(title = "engine displacement(liters) VS.highway miles per gallon",
       x = "engine displacement(liters)",
       y = "highway miles per gallon",
       caption = "data set: mpg")
```

<br>

### อยากทราบว่า Toyota กับ Honda มี cty กับ hwy เป็นอย่างไร 

```{r}
toyota <- mpg %>%
  filter(manufacturer == "toyota")

honda <- mpg %>%
  filter(manufacturer == "honda")
```


```{r}
scatter2 <- ggplot() +
  geom_point(data = toyota, aes(cty, hwy), color = "blue") +
  geom_point(data = honda, aes(cty, hwy), color = "red") +
  theme_minimal() + 
  labs(title = "city miles/gallon VS. highway miles/gallon",
       x = "city miles/gallon",
       y = "highway miles/gallon",
       caption = "data set: mpg")

scatter2
```

<br>

### อยากทราบว่า displ กับ hwy ปี 1999 กับ 2008 ต่างกันไหม

```{r message=FALSE, warning=FALSE}
ggplot(mpg, aes(displ, hwy, color = cyl)) +
 geom_point() +
 geom_smooth(method = lm, color = "red") +
 facet_wrap(~year, ncol = 2) +
 labs(title = "engine displacement VS. highway miles/gallon by years",
       x = "engine displacement (liters)",
       y = "highway (miles per gallon)",
       caption = "data set: mpg")
  
```
