-- 1. Department Headcount

SELECT DEPARTMENT, COUNT(*) AS Total_Employees
FROM employees
GROUP BY DEPARTMENT;

--------------------------------------------------

-- 2. High Earners Club

SELECT DEPARTMENT, AVG(SALARY) AS Avg_Salary
FROM employees
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 50000;

--------------------------------------------------

-- 3. Seniority Check

SELECT DEPARTMENT, MIN(AGE) AS Youngest_Staff
FROM employees
GROUP BY DEPARTMENT;

--------------------------------------------------

-- 4. Busy Hiring Dates

SELECT DATE_OF_JOINING, COUNT(*) AS Total_Joined
FROM employees
GROUP BY DATE_OF_JOINING
HAVING COUNT(*) > 1;

--------------------------------------------------

-- 5. Small Teams Only

SELECT DEPARTMENT
FROM employees
GROUP BY DEPARTMENT
HAVING COUNT(*) < 2;

--------------------------------------------------

-- 6. Experienced Departments

SELECT DEPARTMENT, AVG(AGE) AS Avg_Age
FROM employees
WHERE NAME <> 'SNEHA'
GROUP BY DEPARTMENT;

--------------------------------------------------

-- 7. Salary Range Analysis

SELECT DEPARTMENT,
MAX(SALARY) - MIN(SALARY) AS Salary_Gap
FROM employees
GROUP BY DEPARTMENT;

--------------------------------------------------

-- 8. "V" Name Filter

SELECT DEPARTMENT, COUNT(*) AS V_Names
FROM employees
WHERE NAME LIKE 'V%'
GROUP BY DEPARTMENT;

--------------------------------------------------

-- 9. Mid-Career Department Totals

SELECT DEPARTMENT, SUM(SALARY) AS Total_Salary
FROM employees
WHERE AGE BETWEEN 25 AND 30
GROUP BY DEPARTMENT;

--------------------------------------------------

-- 10. Final Audit

SELECT DEPARTMENT, SUM(SALARY) AS Total_Spent
FROM employees
GROUP BY DEPARTMENT
HAVING COUNT(*) >= 2
AND SUM(SALARY) > 90000;