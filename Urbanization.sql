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

-- Average Urban Population in USA for the period 1960 to 2020
Select AVG(urban_pn) as Avg_Urb_Popn_USA
From Urbanization..urban_rural_popn
Where country = 'United States'