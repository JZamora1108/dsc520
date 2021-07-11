# Assignment: ASSIGNMENT 5.1
# Name: ZAMORA, JESSE
# Date: 07/10/2021

library(readxl)
library(Rcmdr)
library(ggplot2)
library(pastecs)
library(car)

week_7_housing <- read_excel("GitHub/dsc520/data/week-7-housing.xlsx")

week_7_housing_orginial <- read_excel("GitHub/dsc520/data/week-7-housing.xlsx")

head(week_7_housing)

str(week_7_housing)

week_7_housing <- within(week_7_housing, {
  addr_full <- NULL
  building_grade <- NULL
  ctyname <- NULL
  lat <- NULL
  lon <- NULL
  sale_instrument <- NULL 
  sale_reason <- NULL
  sale_warning <- NULL
  sitetype <- NULL
  year_renovated <- NULL 
})

week_7_housing_Updated <- na.omit(week_7_housing)

str(week_7_housing_Updated)

head(week_7_housing_Updated)

RegModel.1 <- lm(Sale.Price~square_feet_total_living, data = week_7_housing_Updated)
summary(RegModel.1)

RegModel.2 <- lm(Sale.Price~square_feet_total_living+bath_full_count+bath_half_count+bath_3qtr_count +bedrooms+sq_ft_lot, 
                 data = week_7_housing_Updated)
summary(RegModel.2)

compareCoefs(RegModel.1, RegModel.2)

anova(RegModel.1, RegModel.2)

library(MASS, pos = 18)

with(week_7_housing_Updated, (t.test(Sale.Price, square_feet_total_living, alternative = 'two.sided', conf.level = .95, paired = TRUE)))

compareCoefs(RegModel.1, RegModel.2)


