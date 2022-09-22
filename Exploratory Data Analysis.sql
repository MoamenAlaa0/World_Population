-- First, let's know the world population
-- It's about 7.97 billion
SELECT FORMAT(SUM(CAST([2022_Population] AS bigint)), 'N') AS world_population
FROM population.dbo.world_population;

-- Top ten countries with highest population
-- We can see that China, India and US are the highest three
SELECT TOP (10) [Country], FORMAT([2022_Population], 'N') AS Country_population
FROM population.dbo.world_population
ORDER BY Rank;

-- Lets see the highest area size
-- Despite China's population inflation, it is not the largest in area
SELECT TOP (10) [Country], [Area]
FROM population.dbo.world_population
ORDER BY 2 DESC;

-- Density for the three highest countries
-- India has a very high density despite it occupies the seventh place in size
SELECT [Country], [Density]
FROM population.dbo.world_population
WHERE Country IN ('China', 'India', 'United States')
ORDER BY 2 DESC;

-- Lets see the highest density
-- Singapore has a large population compared to its area, it makes sense to have a high density.. and this other countries as well
-- Also, according to my knowledge; Singapore and Heng Kong have a high-rise buildings that make the areas densely populated
SELECT TOP (10) [Country], [2022_Population], [Area], [Density]
FROM population.dbo.world_population
ORDER BY 4 DESC;

-- Now, lets see the population in each continent
-- Asia has the highest population then Africa
SELECT [Continent], SUM(CAST([2022_Population] AS bigint)) AS continent_population
FROM population.dbo.world_population
GROUP BY [Continent]
ORDER BY 2 DESC;

-- Top ten countries with highest population in Africa
-- Nigeria, Ethiopia and Egypt are the highest three in Africa
-- Egypt ranked the third with 110 milion people
SELECT TOP (10) [Country], FORMAT([2022_Population], 'N') AS Country_population, FORMAT([Area], 'N') As [Area]
FROM population.dbo.world_population
WHERE [Continent] = 'Africa'
ORDER BY Rank;

-- There is a consistency in the growth rate between all countries
SELECT [Country], [Growth_Rate]
FROM population.dbo.world_population
WHERE [Growth_Rate] < 1;

SELECT MAX([Growth_Rate]), MIN([Growth_Rate])
FROM population.dbo.world_population