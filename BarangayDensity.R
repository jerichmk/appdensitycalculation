


#FOR BARANGAY
population <- read.csv("population.csv")
regionarea <- read.csv("regionarea.csv")


library(dplyr)

# Count of Barangay per Region
CountPerRegion <- group_by(population, Region)
CountPerRegionSummary <-summarise(CountPerRegion, BPR = n())

#Population per Barangay
populationByBarangay <- group_by(population, Barangay, Region,CityProvince)
populationSummary <- arrange(summarise(populationByBarangay, PopulationPerBarangay = sum(Population)), regions = Region)


BarangayArea <- regionarea$Area / CountPerRegionSummary$BPR
regions <- (regionarea[,1])
dataRawFinal <- bind_cols(list(Region = regions, BarangayArea = BarangayArea))

FinalTable <- inner_join(x = populationSummary, y = dataRawFinal, by = "Region")
Final <- mutate(FinalTable, Density = PopulationPerBarangay/BarangayArea)
FinalSorted = Final %>% arrange(desc(Density))
Top5Barangay <- FinalSorted[1:5,]
View(Top5Barangay)
write.csv(FinalTop5, file = "Population Density by Barangay.csv")
