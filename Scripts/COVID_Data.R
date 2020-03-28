#install packages and libraries
install.packages("utils")
install.packages("httr")
library(utils)
library(httr)

#retrieve data
GET("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", authenticate(":", ":", type="ntlm"), write_disk(tf <- tempfile(fileext = ".csv")))

#read data
covid_data <- read.csv(tf)
covid_data$dateRep <- as.Date(covid_data$dateRep, format="%d/%m/%Y")

#calculate total cases by country
covid_data <- covid_data[with(covid_data, order(countriesAndTerritories, dateRep)),]
covid_data$total_cases <- ave(covid_data$cases, covid_data$countriesAndTerritories, FUN=cumsum)
