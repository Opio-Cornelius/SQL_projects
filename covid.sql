/* COVID data */

Select *
From Covid.dbo.covid

-- Get most recent figures. The most recent data ends in 9th February 2022
Create view Recent_death_count as
Select location, date, total_deaths
From Covid.dbo.covid
Where continent is not NULL AND date = '2022-09-02 00:00:00.000'
--Order by total_deaths

-- Replace NULL values with zero (0)
UPDATE Recent_death_count
SET total_deaths = 0
Where total_deaths is NULL

Select *
From Recent_death_count
Order by 3

-- Percentage of deaths
Select location, date, total_deaths, total_cases, (total_deaths/total_cases)*100 as Death_Percentage
From Covid.dbo.covid
Where (total_deaths/total_cases)*100 <= 100 AND continent is not NULL -- There were some countries like North Korea where the deaths recorded were above the total case count.
-- This means that data was not reliable. Its possible that the total cases were wrongly reported.
Order by Death_Percentage desc

-- Percentage of population which got covid. I will only use the most recent values of 2nd September 2022 since these are accumulated values.
Select location, total_cases, population, (total_cases/population)*100 as Percentage_Infected
From Covid.dbo.covid
Where date = '2022-09-02 00:00:00.000' AND continent is not NULL
Order by Percentage_Infected desc

-- Percentage vaccinated by the end of 2021
Select location, population, total_vaccinations, people_fully_vaccinated, (people_fully_vaccinated/population)*100 as Percent_Vaccinated
From Covid.dbo.covid
Where continent is not NULL AND total_vaccinations is not NULL AND people_fully_vaccinated is not NULL
AND date = '2021-12-31 00:00:00.000'
Order by Percent_Vaccinated desc

-- Strength of Health System in Each Country as by end of 2021
Select location, total_tests, hospital_beds_per_thousand
From Covid.dbo.covid
Where continent is not NULL AND date = '2021-12-31 00:00:00.000'
AND hospital_beds_per_thousand is not NULL
Order by total_tests desc
