---
title: "Assignment 4-2"
author: "Zamora, Jesse"
date: "07-18-2021"
output:
  pdf_document: default
html_document: default
word_document: default
bibliography: bibliography.bib
---

# Markdown Basics

## Favorite Foods
1. Italian Food
2. Steak
3. Cereal

## Images
![All Cases (Log Plot)](c:/Users/14029/R Studio Projects/dsc520-master/completed/assignment04/plots/10-all-cases-log.png)


## Add a Quote
> You have power over your mind - not outside events. Realize this and you will find strength.
> - Marcus Aurelius

## Add an Equation

$x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}$
  
  ## Add a Footnote
  
  My footnote is pointless[^1]

[^1]: This footnote is also pointless

## Add Citations

* R for Everyone [@lander2014r]
* Discovering Statistics Using R [@field2012discovering]

# Inline Code 
```{r include=FALSE}
library(ggplot2)
heights_df <- read.csv("data/r4ds/heights.csv")
covid_df <- read.csv("data/nytimes/covid-19-data/us-states.csv")
california_df <- covid_df[ which( covid_df$state == "California"), ]
ny_df <- covid_df[ which( covid_df$state == 'New York'), ]
florida_df <- covid_df[ which( covid_df$state == 'Florida'), ]
```

## NY Times COVID-19 Data
```{r echo=FALSE}
ggplot(data=florida_df, aes(x=date, group=1)) +
  geom_line(aes(y = cases, colour = "Florida")) +
  geom_line(data=ny_df, aes(y = cases,colour="New York")) +
  geom_line(data=california_df, aes(y = cases, colour="California")) +
  scale_colour_manual("",
                      breaks = c('Florida', 'New York', 'California'),
                      values = c('darkred', 'darkgreen', 'steelblue')) +
  xlab(" ") + ylab("Cases") + scale_y_log10()
```


## R4DS Height vs Earnings
```{r echo=FALSE}
ggplot(heights_df, aes(x=height, y=earn, col=sex)) + ggtitle('Height vs. Earnings') + xlab('Height (Inches)') + ylab('Earnings (Dollars)') + geom_point()
```

# Tables

## Pandoc Grid Table with Kable
```{r echo=FALSE}
name <- c("Aragon", "Bilbo", "Frodo", "Galadriel", "Sam", "Gandalf", "Legolas", "Sauron", "Gollum")
race <- c("Men", "Hobbit", "Hobbit", "Elf", "Hobbit", "Maia", "Elf", "Maia", "Hobbit")
in_fellowship <- c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, FALSE)
ring_bearer <- c(FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE)
age <- c(88, 129, 51, 7000, 36, 2019, 2931, 7052, 589)
characters_df <- data.frame(name, race, in_fellowship, ring_bearer, age)
knitr::kable(characters_df, caption="One Ring to Rule Them All")