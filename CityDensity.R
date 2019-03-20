#FOR CITY
library(dplyr)
population <- read.csv("population.csv")
regionarea <- read.csv("regionarea.csv")

# Count of Cities per Region
CountPerRegion <- group_by(population, regions = Region)
CountPerRegionSummary <-summarise(CountPerRegion, Count = n())

# Population Per City
populationByCity <- group_by(population, CityProvince, Region)
populationSummary <- arrange(summarise(populationByCity, PopulationPerCity = sum(Population)), regions = Region)

CityArea <- regionarea$Area / CountPerRegionSummary$Count
regions <- (regionarea[,1])
dataRawFinal <- bind_cols(list(Region = regions, CityArea = CityArea))

FinalTable <- inner_join(x = populationSummary, y = dataRawFinal, by = "Region")
Final <- mutate(FinalTable, Density = PopulationPerCity/CityArea)
FinalSorted = Final %>% arrange(desc(Density))
FinalTop5City <- FinalSorted[1:5,]
View(FinalTop5City)
write.csv(FinalTop5City, file = "Population Density by City.csv")