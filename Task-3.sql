-- SQL DML, TCL, DCL Assignment

CREATE DATABASE college_db;

USE college_db;

CREATE TABLE students (
    ID INT PRIMARY KEY,
    FNAME VARCHAR(30),
    LNAME VARCHAR(30),
    Gender CHAR(1),
    DOB DATE,
    Enrollment_Date DATE,
    Fee_Paid DECIMAL(10,2)
);

INSERT INTO students VALUES 
(101, 'Rahul', 'Kumar', 'M', '2005-05-15', '2023-01-10', 5000.00),
(102, 'Priya', 'Sharma', 'F', '2004-01-20', '2022-12-15', 12000.00),
(103, 'Arjun', 'Singh', 'M', '2005-11-30', '2023-02-01', 0.00),
(104, 'Sneha', 'Patel', 'F', '2003-01-05', '2021-06-20', 15000.00),
(105, 'Kiran', 'Seth', 'O', '2005-08-12', '2023-01-25', 4500.00),
(106, 'Amit', 'Verma', 'M', '2002-12-10', '2019-05-10', 8000.00),
(107, 'Kiran', 'Gupta', 'M', '2004-03-15', '2022-08-14', 9500.00),
(108, 'Anjali', 'Reddy', 'F', '2005-01-25', '2023-03-10', 2000.00),
(109, 'Rohan', 'Das', 'M', '2004-07-04', '2022-11-30', 11000.00),
(110, 'Sanya', 'Iyer', 'F', '2005-09-18', '2023-02-15', 0.00);

SELECT * FROM students;

--------------------------------------------------
-- PART A : DML
--------------------------------------------------

-- 1. Update Fee_Paid for Arjun Singh

UPDATE students
SET Fee_Paid = 4000.00
WHERE ID = 103;

--------------------------------------------------

-- 2. Update gender for Kiran Seth

UPDATE students
SET Gender = 'F'
WHERE ID = 105;

--------------------------------------------------

-- 3. Increase Fee_Paid by 500 for last names starting with 'S'

UPDATE students
SET Fee_Paid = Fee_Paid + 500
WHERE LNAME LIKE 'S%';

--------------------------------------------------

-- 4. Sneha Patel changed last name to Shah

UPDATE students
SET LNAME = 'Shah'
WHERE ID = 104;

--------------------------------------------------

-- 5. Delete students with Fee_Paid = 0

DELETE FROM students
WHERE Fee_Paid = 0.00;

--------------------------------------------------

-- 6. Find students whose first name has exactly 5 characters and ends with 'a'

SELECT FNAME, LNAME
FROM students
WHERE FNAME LIKE '____a';

--------------------------------------------------

-- 7. Delete students who paid more than 14000

DELETE FROM students
WHERE Fee_Paid > 14000;

--------------------------------------------------

-- 8. Give 10% discount to students who paid more than 10000

UPDATE students
SET Fee_Paid = Fee_Paid * 0.90
WHERE Fee_Paid > 10000;

--------------------------------------------------

-- 9. Display only the male student named Kiran

SELECT *
FROM students
WHERE FNAME = 'Kiran'
AND Gender = 'M';

--------------------------------------------------

-- 10. Display names with aliases

SELECT 
FNAME AS First_Name,
LNAME AS Last_Name
FROM students;

--------------------------------------------------
-- PART B : TCL & DCL
--------------------------------------------------

-- 1. Turn off AUTOCOMMIT and rollback deletion

SET AUTOCOMMIT = 0;

DELETE FROM students
WHERE ID = 101;

ROLLBACK;

--------------------------------------------------

-- 2. Transaction with SAVEPOINT

START TRANSACTION;

UPDATE students
SET Fee_Paid = 20000
WHERE ID = 102;

SAVEPOINT Step1;

DELETE FROM students
WHERE ID = 104;

ROLLBACK TO Step1;

--------------------------------------------------

-- 3. Save changes permanently

COMMIT;

--------------------------------------------------

-- 4. Grant SELECT permission to Staff_Member

CREATE USER 'Staff_Member'@'localhost'
IDENTIFIED BY 'password123';

GRANT SELECT
ON college_db.students
TO 'Staff_Member'@'localhost';

--------------------------------------------------

-- 5. Revoke SELECT permission

REVOKE SELECT
ON college_db.students
FROM 'Staff_Member'@'localhost';