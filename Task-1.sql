-- SQL Assignment 1

-- Q1. Create a table named STUDENT with the attributes Student_ID, Student_Name, and Marks, where Student_ID is defined as the Primary Key.

CREATE TABLE STUDENT (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Marks DECIMAL(5,2)
);

--------------------------------------------------

-- Q2. Insert the details of one new student into the STUDENT table.

INSERT INTO STUDENT (Student_ID, Student_Name, Marks)
VALUES (1, 'Rahul', 85);

--------------------------------------------------

-- Q3. Delete the record of a specific student from the STUDENT table.

DELETE FROM STUDENT
WHERE Student_ID = 1;

--------------------------------------------------

-- Q4. Insert more than seven records into the STUDENT table.

INSERT INTO STUDENT VALUES
(1, 'Rahul', 85),
(2, 'Sneha', 78),
(3, 'Amit', 92),
(4, 'Priya', 56),
(5, 'Karan', 43),
(6, 'Neha', 67),
(7, 'Arjun', 39),
(8, 'Meena', 88);

--------------------------------------------------

-- Q5. Retrieve the details of students whose marks are greater than 80.

SELECT *
FROM STUDENT
WHERE Marks > 80;

--------------------------------------------------

-- Q6. Find minimum, maximum, sum, and average of marks.

SELECT MIN(Marks) AS Minimum_Marks
FROM STUDENT;

SELECT MAX(Marks) AS Maximum_Marks
FROM STUDENT;

SELECT SUM(Marks) AS Total_Marks
FROM STUDENT;

SELECT AVG(Marks) AS Average_Marks
FROM STUDENT;

--------------------------------------------------

-- Q7. Display names of students whose marks are greater than 40 and less than 60.

SELECT Student_Name
FROM STUDENT
WHERE Marks > 40
AND Marks < 60;

--------------------------------------------------

-- Q8. Display Student_ID and Marks sorted in descending order of Marks.

SELECT Student_ID, Marks
FROM STUDENT
ORDER BY Marks DESC;

--------------------------------------------------

-- Q9. Display:
-- 1. Marks without decimal places
-- 2. Remainder when marks are divided by 3
-- 3. Square of marks

SELECT
ROUND(Marks) AS Marks_Without_Decimal,
MOD(Marks,3) AS Remainder,
POWER(Marks,2) AS Square_Of_Marks
FROM STUDENT;

--------------------------------------------------

-- Q10. Operations on Student_Name

SELECT
UPPER(Student_Name) AS Uppercase_Name,
LOWER(Student_Name) AS Lowercase_Name,
SUBSTRING(Student_Name,1,3) AS First_Three_Characters,
RIGHT(Student_Name,3) AS Last_Three_Characters,
INSTR(Student_Name,'A') AS Position_Of_A
FROM STUDENT;

--------------------------------------------------

-- Q11. Remove extra spaces

SELECT LTRIM('     Innomatics Research Lab ') AS Left_Trimmed;

SELECT RTRIM(' Innomatics Research Lab     ') AS Right_Trimmed;

SELECT TRIM('     Innomatics Research Lab     ') AS Fully_Trimmed;

--------------------------------------------------

-- Q12. Display today’s date in DD/MM/YYYY format.

SELECT DATE_FORMAT(CURDATE(), '%d/%m/%Y') AS Today_Date;

--------------------------------------------------

-- Q13. Display details for today’s date.

SELECT
DAYNAME(CURDATE()) AS Day_Name,
MONTHNAME(CURDATE()) AS Month_Name,
DAY(CURDATE()) AS Day_Number,
DAYOFMONTH(CURDATE()) AS Day_Of_Month,
DAYOFYEAR(CURDATE()) AS Day_Of_Year;

--------------------------------------------------

-- Q14. Difference between Primary Key and Foreign Key

/*
Primary Key:
- Uniquely identifies each row in a table.
- Cannot contain NULL values.
- Must contain unique values.

Example:
CREATE TABLE STUDENT (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50)
);

Foreign Key:
- Creates relationship between two tables.
- Refers to Primary Key of another table.

Example:
CREATE TABLE COURSE (
    Course_ID INT PRIMARY KEY,
    Student_ID INT,
    FOREIGN KEY (Student_ID)
    REFERENCES STUDENT(Student_ID)
);

Difference:
- Primary Key uniquely identifies records.
- Foreign Key links two tables.
*/