# Assignment: ASSIGNMENT 3
# Name: ZAMORA, JESSE
# Date: 07/03/2021


library(readxl)

library(dplyr)

week_7_housing <- read_excel("GitHub/dsc520/data/week-7-housing.xlsx")

saleprice_mean <- apply(week_7_housing['Sale Price'] , 2, mean)

zipcode_average <- aggregate(`Sale Price` ~ zip5, week_7_housing, mean)

dplyr::mutate('bath_full_count', count = 'bath_full_count' + 'bath_half_count')

##the distribution of the data for the zip code is skewed as the difference between
##the lowest and the highest sale prices is $300,000.00 honestly had a really hard time 
##with the dplyr and did not understand what it is requiring. Outliers could be zip code 98075
##as the other price averages are relatively in tune with each other and this amount is
##so far out of the norm

## the new variables I would create are average sale price and number of bathrooms in
##relation to sale price to see if there is a correlation between bathrooms and sale price