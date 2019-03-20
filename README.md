# appdensitycalculation
This is for the Data Science Toolbox activity of Group 8.

To get the city population density:

The team used dplyr package to execute the code.

First, the team assigned a variable to both the population.csv and regionarea.csv. Next, we grouped the region with the count of its cities using the population variable. 

Second, the team grouped the region and city province each with a sum of the population using the population variable.

Third, the team divided the area of the whole region (using the regionarea variable) over the count of its cities to derive the area of a city (assuming each city in the same region has the same area). Then, the team combined the region name and the area per city into a table.

Fourth, the team used inner join function to converge the area of a city to its respective region. Then, we used mutate function to create a new column, Density, which is the quotient of population and area.

Finally, we sorted the density from highest to lowest, taking only the top 5 cities, then generated a new csv file.
