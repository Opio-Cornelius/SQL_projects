/* 
Common Table Expression (CTE) Example.
These are at times called 'WITH' Queries
*/

WITH cte_jobs AS
(SELECT first_name, last_name, job_title, salary,
COUNT(job_title) OVER (PARTITION BY job_title) AS Number_of_staff
FROM SQL_tutorial_my_own.dbo.employees as emp
JOIN SQL_tutorial_my_own.dbo.jobs as jbb
	ON emp.job_id = jbb.job_id
WHERE salary >= 8000
)
SELECT *
FROM cte_jobs