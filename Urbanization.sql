/* Urbanization Project */

-- General data inspection
Select *
From Urbanization.dbo.urban_rural_popn
Where code is not NULL AND country <> 'World'

-- Country with highest urban population in 2020
Select country, urban_pn
From Urbanization.dbo.urban_rural_popn
Where code is not NULL AND country <> 'World' AND year_ = 2020
Order by urban_pn desc

-- Identify country with highest ratio of urban to rural population in 2020
Select country, (urban_pn/rural_pn) as ratio
From Urbanization.dbo.urban_rural_popn
Where code is not NULL AND country <> 'World' AND rural_pn <> 0 AND year_ = 2020
Order by ratio desc

Create View global_urban_rural_ratio as
Select country, (urban_pn/rural_pn) as ratio
From Urbanization.dbo.urban_rural_popn
Where code is not NULL AND country <> 'World' AND rural_pn <> 0 AND year_ = 2020
--Order by ratio desc

Select *
From global_urban_rural_ratio

-- Average Urban Population in USA for the period 1960 to 2020
Select AVG(urban_pn) as Avg_Urb_Popn_USA
From Urbanization..urban_rural_popn
Where country = 'United States'

-- Select Urban Population by Continent for the year 2020
Select country, urban_pn
From Urbanization.dbo.urban_rural_popn
Where code is NULL AND year_ = 2020 AND country not like '%income'
Order by urban_pn desc

-- Select Urban Population by Country Income level for the year 2020
Select country, urban_pn
From Urbanization.dbo.urban_rural_popn
Where code is NULL AND year_ = 2020 AND country like '%income'
Order by urban_pn desc

-- Calculate Global Average Urban and Rural Population and Ratio
Select AVG(urban_pn) as AvgUrban_pn, AVG(rural_pn) as AvgRural_pn, (AVG(urban_pn)/AVG(rural_pn)) as Ratio
From Urbanization.dbo.urban_rural_popn
Where code = 'OWID_WRL'
