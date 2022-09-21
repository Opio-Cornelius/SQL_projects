/* Updating and Deleting Data - Database Maintenance */

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics

UPDATE [SQL Tutorial].dbo.EmployeeDemographics
SET Age = 33, LastName = 'Church'
WHERE EmployeeID = 1004 AND FirstName = 'Angela'

DELETE FROM [SQL Tutorial].dbo.EmployeeDemographics
WHERE EmployeeID = '1010'

INSERT INTO [SQL Tutorial].dbo.EmployeeDemographics VALUES
(1011, 'Ronald', 'Opio', 29, 'Male')

DELETE
FROM [SQL Tutorial].dbo.EmployeeDemographics
WHERE EmployeeID = '1009'

UPDATE [SQL Tutorial].dbo.EmployeeDemographics
SET EmployeeID = 1012, LastName = 'Baker'
WHERE FirstName = 'Jim' AND LastName = 'Halpert'