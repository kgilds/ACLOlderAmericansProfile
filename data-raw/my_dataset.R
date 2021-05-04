## code to prepare `my_dataset` dataset goes here

library(httr)
library(readxl)
library(dplyr)
library(usmap)

### Get Data

profile_2019 <- ("https://acl.gov/sites/default/files/Aging%20and%20Disability%20in%20America/2019OlderAmericansData.xlsx")


### Write data
httr::GET(profile_2019, write_disk(profile_2019 <- tempfile(fileext = ".xlsx")))


### Read the excel file
p_2019 <- readxl::read_xlsx(profile_2019)

readxl::excel_sheets(profile_2019)


usethis::use_data(p_2019, overwrite = TRUE)


profiles <- readxl::excel_sheets(profile_2019)
profiles  <- as.list(profiles)



profiles %>%
  purrr::map(function(sheet){ # iterate through each sheet name
    readxl::read_xlsx(path = profile_2019, sheet = sheet, skip = 2)
  }) -> profile_data # Assign to a list


usethis::use_data(profile_data, overwrite = TRUE)

### Get sheet 1

person_65_p <- read_excel(profile_2019, sheet = 1, skip =2) %>%
  dplyr::rename(population = "People 65+")



usethis::use_data(person_65_p, overwrite = TRUE)



state_profile <- read_excel(profile_2019, sheet = 6, skip =  2)


dplyr::rename(state_profile, number65plus = "Number of Persons 65 and Older")

state_profile$fips <- fips(state_profile$State)

usethis::use_data(state_profile, overwrite = TRUE)
