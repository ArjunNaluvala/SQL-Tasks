-- Part 1: String & CASE Functions
--------------------------------------------------

SELECT NAME,
CONCAT(LOWER(LEFT(NAME,2)), AGE, UPPER(RIGHT(DEPARTMENT,2))) AS Username
FROM employees;

--------------------------------------------------

SELECT NAME, SALARY,
CASE
    WHEN SALARY > 90000 THEN 'Executive'
    WHEN SALARY BETWEEN 50000 AND 90000 THEN 'Senior'
    ELSE 'Junior'
END AS Appraisal_Status
FROM employees;

--------------------------------------------------

SELECT CONCAT(LEFT(NAME,2),'###',RIGHT(NAME,2)) AS Masked_Name
FROM employees;

--------------------------------------------------

SELECT NAME, DEPARTMENT,
CASE DEPARTMENT
    WHEN 'IT' THEN 'Tech'
    WHEN 'FINANCE' THEN 'Accounts'
    WHEN 'HR' THEN 'People'
    ELSE 'General'
END AS Dept_Name
FROM employees;

--------------------------------------------------

SELECT NAME,
INSTR(NAME,'A') AS Position_Of_A
FROM employees
WHERE NAME LIKE '%A%';

--------------------------------------------------
-- Part 2: Aggregate Functions
--------------------------------------------------

SELECT DEPARTMENT,
SUM(SALARY) AS Total_Salary,
AVG(SALARY) AS Avg_Salary
FROM employees
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 55000;

--------------------------------------------------

SELECT MAX(AGE) - MIN(AGE) AS Age_Spread
FROM employees;

--------------------------------------------------

SELECT COUNT(*) AS IT_Count
FROM employees
WHERE DEPARTMENT='IT'
AND SALARY > 45000;

--------------------------------------------------

SELECT ROUND(AVG(SALARY)) AS Avg_Salary
FROM employees;

--------------------------------------------------

SELECT DEPARTMENT, MAX(SALARY) AS Max_Salary
FROM employees
WHERE NAME NOT LIKE 'S%'
GROUP BY DEPARTMENT;

--------------------------------------------------
-- Part 3: Date & Time Functions
--------------------------------------------------

SELECT NAME,
DATE_ADD(DATE_OF_JOINING, INTERVAL 90 DAY) AS Probation_End
FROM employees;

--------------------------------------------------

SELECT NAME,
TIMESTAMPDIFF(YEAR, DATE_OF_JOINING, CURDATE()) AS Experience_Years
FROM employees;

--------------------------------------------------

SELECT NAME,
DAYNAME(DATE_OF_JOINING) AS Join_Day
FROM employees
WHERE DAYNAME(DATE_OF_JOINING) IN ('Saturday','Sunday');

--------------------------------------------------

SELECT NAME,
(60 - AGE) AS Years_Left
FROM employees;

--------------------------------------------------

SELECT NAME,
MONTHNAME(DATE_OF_JOINING) AS Join_Month
FROM employees
ORDER BY MONTH(DATE_OF_JOINING);