/*** Global Health Expenditure Project ***/

-- Check country with the highest health expenditure per capita in 2019
Select Country, [Indicator:Current health expenditure (CHE) per capita in PPP int]
From Global_Health_Expenditure.dbo.annual_expenditure
Where code is not NULL AND Year = 2019 -- Excluding continent data and selecting the 
-- most recent year 2019
Order by 2 desc

-- Check average health expenditure for the United States between 2002 and 2019
Select Country, AVG([Indicator:Current health expenditure (CHE) per capita in PPP int]) as CHE
From Global_Health_Expenditure.dbo.annual_expenditure
Where code is not NULL AND Country = 'United States'
Group by Country

-- Select data for comparing the mortality rate to the health expenditure.
-- This will be done for only United Kingdom
Select Country, Year, [Mortality rate, under-5 (per 1,000 live births)], 
[Current health expenditure per capita, PPP (current internationa]
From Global_Health_Expenditure.dbo.child_mortality_vs_health_exp
Where Code not like 'OWID%' AND Country = 'United Kingdom' AND
[Current health expenditure per capita, PPP (current internationa] is not NULL
--Only include years which have data

-- Join annual health expenditure table to health covergae table
-- and compare health expenditure per capita to the GDP per capita
Select AE.Country, [Indicator:Current health expenditure (CHE) per capita in PPP int],
[GDP per capita, PPP (constant 2017 international $)]
From Global_Health_Expenditure.dbo.annual_expenditure as AE
Full Outer JOIN Global_Health_Expenditure.dbo.health_coverage_vs_gdp_per_capita AS HEvGDP
	ON AE.Country = HEvGDP.Country

-- Join table to annual expenditure to the table of public health expenditure
-- Check what percentage of health budget is used for public health issues
-- Only select countries which exist in both tables
Select *
From Global_Health_Expenditure.dbo.public_health_exp as PH
Left Join Global_Health_Expenditure.dbo.annual_expenditure as AE
	ON PH.Country = AE.Country
Where PH.Country is not NULL AND AE.Country is not NULL
AND PH.Country = 'United States'