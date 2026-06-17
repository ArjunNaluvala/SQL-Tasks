CREATE DATABASE University_DB;

USE University_DB;

CREATE TABLE Students (
    StudentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Age INT,
    City VARCHAR(50),
    CourseID INT
);

--------------------------------------------------
-- PART A : CONSTRAINTS
--------------------------------------------------

-- 1. Make StudentID Primary Key with AUTO_INCREMENT

ALTER TABLE Students
MODIFY StudentID INT AUTO_INCREMENT PRIMARY KEY;

--------------------------------------------------

-- 2. FirstName should not be empty

ALTER TABLE Students
MODIFY FirstName VARCHAR(50) NOT NULL;

--------------------------------------------------

-- 3. Make Email Unique

ALTER TABLE Students
ADD CONSTRAINT unique_email UNIQUE (Email);

--------------------------------------------------

-- 4. Age should be 17 or above

ALTER TABLE Students
ADD CONSTRAINT chk_age CHECK (Age >= 17);

--------------------------------------------------

-- 5. Default city as 'Unknown'

ALTER TABLE Students
ALTER City SET DEFAULT 'Unknown';

--------------------------------------------------

-- 6. Create Courses table and add Foreign Key

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

ALTER TABLE Students
ADD CONSTRAINT fk_course
FOREIGN KEY (CourseID)
REFERENCES Courses(CourseID);

--------------------------------------------------

-- Insert sample data into Courses table

INSERT INTO Courses VALUES
(1, 'Data Science'),
(2, 'Web Development'),
(3, 'Cloud Computing');

--------------------------------------------------

-- 7. Insert student with age 15

INSERT INTO Students VALUES
(108, 'Ravi', 'Kumar', 'ravi@uni.com', 15, 'Chennai', 1);

-- Error:
-- Check constraint 'chk_age' is violated.
-- Because age must be 17 or above.

--------------------------------------------------

-- 8. Drop Unique constraint from Email

ALTER TABLE Students
DROP INDEX unique_email;

--------------------------------------------------

-- 9. Remove Primary Key

ALTER TABLE Students
MODIFY StudentID INT;

ALTER TABLE Students
DROP PRIMARY KEY;

--------------------------------------------------

-- 10. Allow NULL values in LastName

ALTER TABLE Students
MODIFY LastName VARCHAR(50) NULL;

--------------------------------------------------
-- Insert Student Records
--------------------------------------------------

INSERT INTO Students VALUES 
(101, 'Aman', 'Sharma', 'aman@uni.com', 20, 'Delhi', 1),
(102, 'Sita', 'Verma', 'sita@uni.com', 22, 'Mumbai', 2),
(103, 'John', 'Doe', 'john@uni.com', 19, 'Delhi', 1),
(104, 'Anjali', 'Nair', 'anjali@uni.com', 21, 'Bangalore', 3),
(105, 'Rahul', 'Gupta', 'rahul@uni.com', 23, 'Mumbai', 2),
(106, 'Sanya', 'Malhotra', 'sanya@uni.com', 20, 'Delhi', 1),
(107, 'Kevin', 'Peter', 'kevin@uni.com', 24, 'Bangalore', 3);

--------------------------------------------------
-- PART B : CLAUSES
--------------------------------------------------

-- 1. Students from Delhi

SELECT *
FROM Students
WHERE City = 'Delhi';

--------------------------------------------------

-- 2. Unique cities

SELECT DISTINCT City
FROM Students;

--------------------------------------------------

-- 3. FirstName and Age sorted by Age

SELECT FirstName, Age
FROM Students
ORDER BY Age ASC;

--------------------------------------------------

-- 4. First 3 records

SELECT *
FROM Students
LIMIT 3;

--------------------------------------------------

-- 5. Students older than 20

SELECT 
FirstName AS Name,
Email AS Contact
FROM Students
WHERE Age > 20;

--------------------------------------------------

-- 6. Students not from Bangalore

SELECT *
FROM Students
WHERE City <> 'Bangalore'
ORDER BY FirstName ASC;

--------------------------------------------------

-- 7. 3 oldest students

SELECT FirstName, City
FROM Students
ORDER BY Age DESC
LIMIT 3;

--------------------------------------------------

-- 8. Mumbai or Delhi students

SELECT FirstName, Age
FROM Students
WHERE City IN ('Mumbai', 'Delhi')
ORDER BY Age DESC
LIMIT 2 OFFSET 1;

--------------------------------------------------

-- 9. Students aged between 19 and 22

SELECT FirstName, LastName
FROM Students
WHERE Age BETWEEN 19 AND 22
ORDER BY LastName
LIMIT 4;

--------------------------------------------------

-- 10. Unique ages of Delhi students

SELECT DISTINCT Age
FROM Students
WHERE City = 'Delhi'
ORDER BY Age DESC;