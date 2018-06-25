# *************************************************************
# Load useful packages
# *************************************************************
library(tidyverse)

# *************************************************************
# Read a sample of the data
# *************************************************************
elec_power_temp = read_delim("Coursera/Exploratory Data Analysis/household_power_consumption.txt",
                             delim = ";", n_max = 10000, na = "?")

# *************************************************************
# Check for any import problems 
# *************************************************************
problems(elec_power_temp)

# *************************************************************
# Read data for 1/2/2007 and 2/2/2007 only
# *************************************************************
# The data starts on 16/12/2006 at 17:23.
# There are 396 rows for 16/12/2006 (from 17:23 through 23:59). We want data starting for 1/2/2007 and 2/2/2007.
# We can calculate the number of records to skip in order to read data starting on 1/2/2007.

date_start = as.Date("17/12/2006", format = "%d/%m/%Y"); date_start
date_end = as.Date("01/02/2007", format = "%d/%m/%Y"); date_end
days_diff = difftime(as.POSIXct(date_end), as.POSIXct(date_start), units = "mins")
days_diff

# there are 46 days, or 66240 mins
# The number of records to skip = 396 + 66240 + 1 = 66637 records
# The number of records to read is 2 days * 24 hours/day * 60 mins/hour = 2880 records

test = spec(elec_power_temp)

elec_power = read_delim("Coursera/Exploratory Data Analysis/household_power_consumption.txt",
                        delim = ";", skip = 66637, n_max = 2880,
                        col_names = names(elec_power_temp)
                        # , col_types = cols("c","t", "d", "d", "d", "d", "d", "d", "d")
)
# *************************************************************
# Convert Date column to format date
# *************************************************************
elec_power = elec_power %>% mutate(Date = dmy(Date))

