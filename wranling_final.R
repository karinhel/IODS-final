#####################################################################################################

###### FINAL ASSIGNMENT #########

# Data wranling
# Karin Helander
# karin.a.helander@helsinki.fi
# Date: 07.03.2017


# We are going to do a data wrangling for R's own dataset 'Tea' from the package FactoMineR.
# After the wranling, the data will be used for logistic regression analysis purposes.


####################################################################################################
##########################

# First opening the library and dataset

library(FactoMineR)

data("tea")

# Structure of the data

dim(tea)
str(tea)

# There are 300 observations of 36 variables, which consider tea drinking habits.
# We now choose to take a subset of the data,
#       because our analysis does not necessarily need all of the variables.


library(dplyr)

# Variables for the new data (sub)set

keep <- c("sex", "age_Q", "SPC", "frequency", "how", "price", "Tea", "relaxing")

# The data will be called 'tea_log';

tea_log <- select(tea, one_of(keep))

# And the stucture shows that the subset is correctly done :)

str(tea_log)

# Next we will take a look at the 'Tea' variable, which is a three class variable of
#   the tea flavor that the individual prefers. We want only to have options "black" and "green"
#   instead of "black", "earl grey" and "green", since earl grey is also a black tea flavor.

# A new logical vector will be 1 if 'Tea' is "black" or "earl grey", that is values 1 or 2
#                          and 0 if 'Tea' is "green", the value 3.

# Saving the Tea variable to a new variable name 
tea_log$teaclass <- tea_log$Tea

# Changing the levels into two-leveled factor 
levels(tea_log$teaclass) <- c("black", "black", "green")

# Checking whether it went the right way;
str(tea_log$teaclass)


# Saving the data

write.csv(tea_log, file="tea")



