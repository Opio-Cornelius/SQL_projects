/****
Temp Tables
****/

-- Case 1

SELECT *
FROM SQL_tutorial_my_own.dbo.employees

DROP TABLE IF EXISTS #Access
CREATE TABLE #Access
(employee_id int,
first_name varchar(50),
last_name varchar(50),
phone_number varchar(20)
)

SELECT *
FROM #Access

INSERT INTO #Access
SELECT employee_id, first_name, last_name, phone_number
FROM SQL_tutorial_my_own.dbo.employees


-- Case 2
DROP TABLE IF EXISTS #quick_dept
CREATE TABLE #quick_dept(
Full_name varchar (50),
department_name varchar(50)
)

INSERT INTO #quick_dept
SELECT first_name + ' ' + last_name AS Full_name, department_name
FROM SQL_tutorial_my_own.dbo.employees as emp
JOIN SQL_tutorial_my_own.dbo.departments as dpp
	ON emp.department_id = dpp.department_id

SELECT *
FROM #quick_dept