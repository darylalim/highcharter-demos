# Load packages ----------------------------------------------------------------
library(tibble)
library(dplyr)
library(forcats)
library(readr)

# Build Europe data ------------------------------------------------------------
europe <- tibble(
  c("Germany", 767.1), 
  c("Croatia", 20.7),
  c("Belgium", 97.2),
  c("Czech Republic", 111.7),
  c("Netherlands", 158.1),
  c("Spain", 241.6),
  c("Ukraine", 249.1),
  c("Poland", 298.1),
  c("France", 323.7),
  c("Romania", 78.3),
  c("United Kingdom", 415.4), 
  c("Turkey", 353.2), 
  c("Italy",337.6),
  c("Greece", 71.1),
  c("Austria", 69.8),
  c("Belarus", 67.7),
  c("Serbia", 59.3),
  c("Finland", 54.8),
  c("Bulgaria", 51.2),
  c("Portugal", 48.3),
  c("Norway", 44.4),
  c("Sweden", 44.3),
  c("Hungary", 43.7),
  c("Switzerland", 40.2),
  c("Denmark", 40),
  c("Slovakia", 34.7),
  c("Ireland", 34.6),
  c("Estonia", 19.4),
  c("Slovenia", 16.7),
  c("Lithuania", 12.3),
  c("Luxembourg", 10.4),
  c("Macedonia", 9.5),
  c("Moldova", 7.8),
  c("Latvia", 7.5),
  c("Cyprus", 7.2)
) %>% 
  t() %>% 
  as_tibble() %>% 
  rename(
    country = V1,
    carbon_emissions = V2
  ) %>% 
  mutate(
    continent = "Europe",
    .before = country
  )

# Build Africa data ------------------------------------------------------------
africa <- tibble(
  c("Senegal", 8.2),
  c("Cameroon", 9.2),
  c("Zimbabwe", 13.1),
  c("Ghana", 14.1),
  c("Kenya", 14.1),
  c("Sudan", 17.3),
  c("Tunisia", 24.3),
  c("Angola", 25),
  c("Libya", 50.6),
  c("Ivory Coast", 7.3),
  c("Morocco", 60.7),
  c("Ethiopia", 8.9),
  c("United Republic of Tanzania", 9.1),
  c("Nigeria", 93.9),
  c("South Africa", 392.7), 
  c("Egypt", 225.1), 
  c("Algeria", 141.5)
) %>% 
  t() %>% 
  as_tibble() %>% 
  rename(
    country = V1,
    carbon_emissions = V2
  ) %>% 
  mutate(
    continent = "Africa",
    .before = country
  )

# Build Oceania data -----------------------------------------------------------
oceania <- tibble(
  c("Australia", 409.4),
  c("New Zealand", 34.1),
  c("Papua New Guinea", 7.1)
) %>% 
  t() %>% 
  as_tibble() %>% 
  rename(
    country = V1,
    carbon_emissions = V2
  ) %>% 
  mutate(
    continent = "Oceania",
    .before = country
  )

# Build North America data -----------------------------------------------------
north_america <- tibble(
  c("Costa Rica", 7.6),
  c("Honduras", 8.4),
  c("Jamaica", 8.3),
  c("Panama", 10.2),
  c("Guatemala", 12),
  c("Dominican Republic", 23.4),
  c("Cuba", 30.2),
  c("USA", 5334.5), 
  c("Canada", 566), 
  c("Mexico", 456.3)
) %>% 
  t() %>% 
  as_tibble() %>% 
  rename(
    country = V1,
    carbon_emissions = V2
  ) %>% 
  mutate(
    continent = "North America",
    .before = country
  )

# Build South America data -----------------------------------------------------
south_america <- tibble(
  c("El Salvador", 7.2),
  c("Uruguay", 8.1),
  c("Bolivia", 17.8),
  c("Trinidad and Tobago", 34),
  c("Ecuador", 43),
  c("Chile", 78.6),
  c("Peru", 52),
  c("Colombia", 74.1),
  c("Brazil", 501.1), 
  c("Argentina", 199),
  c("Venezuela", 195.2)
) %>% 
  t() %>% 
  as_tibble() %>% 
  rename(
    country = V1,
    carbon_emissions = V2
  ) %>% 
  mutate(
    continent = "South America",
    .before = country
  )

# Build Asia data --------------------------------------------------------------
asia <- tibble(
  c("Nepal", 6.5),
  c("Georgia", 6.5),
  c("Brunei Darussalam", 7.4),
  c("Kyrgyzstan", 7.4),
  c("Afghanistan", 7.9),
  c("Myanmar", 9.1),
  c("Mongolia", 14.7),
  c("Sri Lanka", 16.6),
  c("Bahrain", 20.5),
  c("Yemen", 22.6),
  c("Jordan", 22.3),
  c("Lebanon", 21.1),
  c("Azerbaijan", 31.7),
  c("Singapore", 47.8),
  c("Hong Kong", 49.9),
  c("Syria", 52.7),
  c("DPR Korea", 59.9),
  c("Israel", 64.8),
  c("Turkmenistan", 70.6),
  c("Oman", 74.3),
  c("Qatar", 88.8),
  c("Philippines", 96.9),
  c("Kuwait", 98.6),
  c("Uzbekistan", 122.6),
  c("Iraq", 139.9),
  c("Pakistan", 158.1),
  c("Vietnam", 190.2),
  c("United Arab Emirates", 201.1),
  c("Malaysia", 227.5),
  c("Kazakhstan", 236.2),
  c("Thailand", 272),
  c("Taiwan", 276.7),
  c("Indonesia", 453),
  c("Saudi Arabia", 494.8),
  c("Japan", 1278.9),
  c("China", 10540.8),
  c("India", 2341.9),
  c("Russia", 1766.4),
  c("Iran", 618.2),
  c("Korea", 610.1)
) %>% 
  t() %>% 
  as_tibble() %>% 
  rename(
    country = V1,
    carbon_emissions = V2
  ) %>% 
  mutate(
    continent = "Asia",
    .before = country
  )

# Bind data by rows ------------------------------------------------------------
global_carbon_emissions_2014 <- bind_rows(
  europe,
  africa,
  oceania,
  north_america,
  south_america,
  asia
) %>% 
  mutate(
    continent = as_factor(continent),
    carbon_emissions = as.numeric(carbon_emissions)
  )

# Write CSV file ---------------------------------------------------------------
write_csv(global_carbon_emissions_2014, "highcharts-core/scatter-and-bubble-charts/data/global_carbon_emissions_2014.csv")
