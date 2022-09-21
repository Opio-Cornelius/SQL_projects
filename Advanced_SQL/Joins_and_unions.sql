/*
About Joins and Unions
*/

/* Using 1st Database */
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics
Full Outer Join EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Ronald'
ORDER BY Salary DESC

SELECT JobTitle, AVG(Salary) AS SalesmanAVG
FROM EmployeeDemographics
Full Outer Join EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle


/* Using 2nd Database */
SELECT SQL_tutorial_my_own.dbo.employees.job_id, job_title, first_name, last_name, salary
FROM SQL_tutorial_my_own.dbo.employees
Full Outer Join SQL_tutorial_my_own.dbo.jobs
	on SQL_tutorial_my_own.dbo.employees.job_id = SQL_tutorial_my_own.dbo.jobs.job_id
ORDER BY salary DESC

/* Calclating Average Salary of an Accountant */
SELECT job_title, AVG(salary) AS AVGSalary_Accountant
FROM SQL_tutorial_my_own.dbo.employees
Full Outer Join SQL_tutorial_my_own.dbo.jobs
	on SQL_tutorial_my_own.dbo.employees.job_id = SQL_tutorial_my_own.dbo.jobs.job_id
WHERE job_title = 'Accountant'
GROUP BY job_title


/* Create a table and make a union with existing table */

CREATE TABLE RemoteJobs
(job_id int,
job_title varchar(20),
min_salary int,
max_salary int)

INSERT INTO RemoteJobs VALUES
(20, 'Data Analyst', 6500, 12000),
(21, 'Blogger', 5000, 15000),
(22, 'Ad Manager', 6000, 12000)

SELECT *
FROM SQL_tutorial_my_own.dbo.jobs
UNION
SELECT *
FROM SQL_tutorial_my_own.dbo.RemoteJobs