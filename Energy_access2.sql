/** ENERGY ACCESS PROJECT **/

-- Select Average number of people with and without electricity access in 2016
Select AVG(Number_of_people_with_access_to_electricity) as Avg_with_access,
AVG(Number_of_people_without_access_to_electricity) as Avg_without_access
From Energy_access.dbo.num_with_and_without_elec
Where Year = 2016 AND Code is not NULL 

-- Check for effectiveness of electrification programs per region during
-- the period 2000 to 2019
Select Country, Year, Number_of_people_with_access_to_electricity, Number_of_people_without_access_to_electricity
from Energy_access.dbo.num_with_and_without_elec
Where Year >= 2000 and Code is NULL and Country not like '%income'
and Country not like '%demographic%' and Country not like '%total'
Order by Number_of_people_with_access_to_electricity desc

-- Calculate share of population with access to clean energy in 2016
Select Country, Year, 
(number_with_clean_fuels_cooking/(number_with_clean_fuels_cooking + number_without_clean_fuels_cooking))*100 as
percentage_with_access
From Energy_access.dbo.num_with_and_without_clean
Where Country is not NULL AND Year = 2016
Order by percentage_with_access desc

-- Which country has the highest share of people with access to electricity in 2016
Select Country, Access_to_electricity_percent
From Energy_access.dbo.share_of_popn_elec
Where Code is not NULL AND Year = 2016
Order by Access_to_electricity_percent desc

-- Select Countries which have had more than 15,000,000 people
-- without access to electricity since 2010
Select Country, Year, Number_of_people_without_access_to_electricity
From Energy_access.dbo.num_without_elec_country
Where Code is not NULL AND Year BETWEEN 2010 AND 2016
AND Number_of_people_without_access_to_electricity >= 15000000
AND Country <> 'World'