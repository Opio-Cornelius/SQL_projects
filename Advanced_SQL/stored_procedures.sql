/*
Stored Procedures 
*/

CREATE PROCEDURE salary_raise AS
SELECT first_name + ' ' + last_name AS Names, job_title, salary,
CASE
	WHEN salary < 5000 THEN salary + (salary * 0.1)
	WHEN salary BETWEEN 5000 AND 10000 THEN salary + (salary * 0.5)
	WHEN salary >= 5000 THEN salary + (salary * 0.03)
END AS New_Salary
FROM SQL_tutorial_my_own.dbo.employees as emp
JOIN SQL_tutorial_my_own.dbo.jobs as jbb
ON emp.job_id = jbb.job_id


EXEC salary_raise