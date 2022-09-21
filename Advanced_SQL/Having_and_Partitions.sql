/* HAVING */

SELECT JobTitle, AVG(Salary) AS AvgSalary
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) >= 30000
ORDER BY AVG(Salary) DESC

/* PARTIOTION BY */
SELECT FirstName, LastName, Gender, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID