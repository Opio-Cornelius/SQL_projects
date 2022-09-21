/* Case statements */

/* Using database 1 */
SELECT FirstName, LastName, Age,
CASE
	WHEN Age BETWEEN 29 AND 37 THEN 'Mature'
	WHEN Age >= 38 THEN 'Old'
	ELSE 'Young'
END
FROM [SQL Tutorial].dbo.EmployeeDemographics
ORDER BY Age

SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * 0.1)
	WHEN JobTitle = 'DataAnalyst' THEN Salary + (Salary * 0.08)
	ELSE Salary + (Salary * 0.02)
END AS RaiseSalary
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/* Using database 2. 
In this case we are giving salary increments to all staff,
and the least paid staff will get the highest increments.
*/
SELECT first_name, last_name, job_title, salary,
CASE
	WHEN salary < 8000 THEN salary + (salary * 0.05)
	WHEN salary BETWEEN 8000 AND 12000 THEN salary + (salary * 0.04)
	WHEN salary BETWEEN 13000 AND 18000 THEN salary + (salary * 0.03)
	ELSE salary + (salary * 0.02)
END AS NewSalary
FROM SQL_tutorial_my_own.dbo.employees
JOIN SQL_tutorial_my_own.dbo.jobs
	ON employees.job_id = jobs.job_id
ORDER BY salary 