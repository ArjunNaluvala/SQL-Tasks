-- QUESTION 1

-- EMPLOYEE_DETAILS TABLE

CREATE TABLE EMPLOYEE_DETAILS (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_name VARCHAR(50),
    mobile_no BIGINT,
    email_id VARCHAR(100),
    manager_id INT
);

INSERT INTO EMPLOYEE_DETAILS VALUES
(101, 'Arjun', 'HR', 9876543210, 'arjun.hr@gmail.com', 201),
(102, 'Sneha', 'Finance', 9123456780, 'sneha.fin@gmail.com', 202),
(103, 'Karthik', 'IT', 9988776655, 'karthik.it@gmail.com', 203),
(104, 'Meera', 'IT', 9090909090, 'meera.it@gmail.com', 203),
(105, 'Nikhil', 'Marketing', 9345678901, 'nikhil.mkt@gmail.com', 204);

--------------------------------------------------

-- EMPDEPT TABLE

CREATE TABLE EMPDEPT (
    deptid VARCHAR(10) PRIMARY KEY,
    deptname VARCHAR(50),
    dept_off VARCHAR(50),
    depthead INT
);

INSERT INTO EMPDEPT VALUES
('D01', 'Human Resources', 'Hyderabad', 101),
('D02', 'Information Tech', 'Bangalore', 102),
('D03', 'Finance', 'Mumbai', 103),
('D04', 'Marketing', 'Delhi', 104),
('D05', 'Sales', 'Chennai', 105),
('D06', 'Operations', 'Pune', 106),
('D07', 'Data Science', 'Hyderabad', 107),
('D08', 'Customer Support', 'Kochi', 108),
('D09', 'Research', 'Bangalore', 109),
('D10', 'Administration', 'Mumbai', 110);

--------------------------------------------------

-- EMPSALARY TABLE

CREATE TABLE EMPSALARY (
    empid INT,
    salary INT,
    ispermanent VARCHAR(10),
    FOREIGN KEY (empid) REFERENCES EMPLOYEE_DETAILS(emp_id)
);

INSERT INTO EMPSALARY VALUES
(101, 55000, 'Yes'),
(102, 65000, 'Yes'),
(103, 60000, 'Yes'),
(104, 48000, 'No'),
(105, 52000, 'Yes'),
(106, 45000, 'No'),
(107, 70000, 'Yes'),
(108, 40000, 'No'),
(109, 75000, 'Yes'),
(110, 50000, 'Yes');

--------------------------------------------------
-- QUESTION 2
--------------------------------------------------

-- 1(a) Employees whose name starts with 'P'

SELECT *
FROM EMPLOYEE_DETAILS
WHERE emp_name LIKE 'P%';

--------------------------------------------------

-- 1(b) Count of permanent employees whose salary > 5000

SELECT COUNT(*) AS Permanent_Employees
FROM EMPSALARY
WHERE ispermanent = 'Yes'
AND salary > 5000;

--------------------------------------------------

-- 1(c) Employees whose email belongs to Gmail

SELECT *
FROM EMPLOYEE_DETAILS
WHERE email_id LIKE '%gmail.com';

--------------------------------------------------

-- 2(a) Total salary paid to permanent employees

SELECT SUM(salary) AS Total_Salary
FROM EMPSALARY
WHERE ispermanent = 'Yes';

--------------------------------------------------

-- 2(b) Employees whose name ends with 'a'

SELECT emp_name
FROM EMPLOYEE_DETAILS
WHERE emp_name LIKE '%a';

--------------------------------------------------

-- 3(a) Nested query for employees working under 'Abhishek'

SELECT emp_name
FROM EMPLOYEE_DETAILS
WHERE manager_id = (
    SELECT emp_id
    FROM EMPLOYEE_DETAILS
    WHERE emp_name = 'Abhishek'
);

--------------------------------------------------

-- 3(b) Names of employee heads who are permanent employees

SELECT emp_name
FROM EMPLOYEE_DETAILS
WHERE emp_id IN (
    SELECT empid
    FROM EMPSALARY
    WHERE ispermanent = 'Yes'
);

--------------------------------------------------

-- 4(a) LEFT JOIN

SELECT *
FROM EMPLOYEE_DETAILS E
LEFT JOIN EMPSALARY S
ON E.emp_id = S.empid;

--------------------------------------------------

-- 4(b) RIGHT JOIN

SELECT *
FROM EMPLOYEE_DETAILS E
RIGHT JOIN EMPSALARY S
ON E.emp_id = S.empid;

--------------------------------------------------

-- 4(c) INNER JOIN

SELECT *
FROM EMPLOYEE_DETAILS E
INNER JOIN EMPSALARY S
ON E.emp_id = S.empid;

--------------------------------------------------

-- 4(d) CROSS JOIN

SELECT *
FROM EMPLOYEE_DETAILS
CROSS JOIN EMPDEPT;

--------------------------------------------------

-- 4(e) Difference Between Joins

/*
LEFT JOIN:
Returns all records from left table and matching records from right table.

RIGHT JOIN:
Returns all records from right table and matching records from left table.

INNER JOIN:
Returns only matching records from both tables.

CROSS JOIN:
Returns Cartesian product of both tables.
Each row from first table combines with every row from second table.
*/

--------------------------------------------------

-- 5(a) Update employee name to 'Maria' where emp_id = 10

UPDATE EMPLOYEE_DETAILS
SET emp_name = 'Maria'
WHERE emp_id = 10;

--------------------------------------------------

-- 5(b) Delete record where emp_id = 10

DELETE FROM EMPLOYEE_DETAILS
WHERE emp_id = 10;

--------------------------------------------------

-- 6(a) Add new column

ALTER TABLE EMPLOYEE_DETAILS
ADD address VARCHAR(100);

--------------------------------------------------

-- 6(b) Remove newly added column

ALTER TABLE EMPLOYEE_DETAILS
DROP COLUMN address;

--------------------------------------------------

-- 7(a) Count employees receiving same salary

SELECT salary, COUNT(*) AS Employee_Count
FROM EMPSALARY
GROUP BY salary;

--------------------------------------------------

-- 7(b) Common salaries with count greater than 5

SELECT salary, COUNT(*) AS Employee_Count
FROM EMPSALARY
GROUP BY salary
HAVING COUNT(*) > 5
ORDER BY salary DESC;

--------------------------------------------------

-- 8(a) Explain JOINS and Types

/*
JOINS are used to combine rows from two or more tables based on related columns.

Types of JOINS:
1. INNER JOIN  - Returns matching rows from both tables.
2. LEFT JOIN   - Returns all rows from left table and matching rows from right table.
3. RIGHT JOIN  - Returns all rows from right table and matching rows from left table.
4. FULL JOIN   - Returns all rows when there is a match in either table.
5. CROSS JOIN  - Returns all possible combinations of rows from tables.
*/

--------------------------------------------------

-- 8(b) UNION, INTERSECT, MINUS

/*
UNION:
Combines results from two queries and removes duplicates.

INTERSECT:
Returns only common rows from both queries.

MINUS:
Returns rows from first query that are not present in second query.
*/

--------------------------------------------------

-- 8(c) Difference between TRUNCATE, DELETE, DROP

/*
DELETE:
Removes selected rows from a table using WHERE condition.
Table structure remains.

TRUNCATE:
Removes all rows from table quickly.
Cannot use WHERE condition.
Table structure remains.

DROP:
Deletes entire table including structure and data.
*/