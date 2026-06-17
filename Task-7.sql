-- PART 1: JOINS

-- 1. The Missing Link:
-- Show the NAME of each employee and their dept_name.
-- If an employee's department is not in the departments table,
-- they should not appear in the list.

SELECT e.NAME, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.DEPARTMENT = d.dept_name;


-- 2. The "Vineela" Case:
-- List every employee's NAME and their dept_name.
-- Ensure that employees with no department still appear.

SELECT e.NAME, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.DEPARTMENT = d.dept_name;


-- 3. The Ghost Department:
-- List all dept_names.
-- If a department has no employees, show NULL for employee name.

SELECT d.dept_name, e.NAME
FROM departments d
LEFT JOIN employees e
ON d.dept_name = e.DEPARTMENT;


-- 4. The Boss's Boss:
-- Show each employee's NAME and their manager's NAME.

SELECT e.NAME AS Employee_Name,
       m.NAME AS Manager_Name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.ID;


-- 5. The Department Audit:
-- Find employees whose DEPARTMENT does not match any dept_name.

SELECT e.NAME, e.DEPARTMENT
FROM employees e
LEFT JOIN departments d
ON e.DEPARTMENT = d.dept_name
WHERE d.dept_name IS NULL;


-- PART 2: SET OPERATIONS

-- 6. The ID Conflict:
-- Combine all employee IDs and dept_ids into one column.
-- Show every value even if duplicates exist.

SELECT ID AS All_IDs
FROM employees

UNION ALL

SELECT dept_id
FROM departments;


-- 7. The Overlap:
-- Find ID numbers used as both Employee ID and Department ID.

SELECT ID
FROM employees
WHERE ID IN (
    SELECT dept_id
    FROM departments
);


-- 8. The "Pure" Employees:
-- List employee IDs that are not also dept_ids.

SELECT ID
FROM employees
WHERE ID NOT IN (
    SELECT dept_id
    FROM departments
);


-- 9. The Alphabetical Mix:
-- Create one list of employee names and department names.
-- Sort alphabetically.

SELECT NAME AS Names_List
FROM employees

UNION

SELECT dept_name
FROM departments

ORDER BY Names_List;


-- 10. The Manager Check:
-- List all employee IDs that are NOT acting as manager_id.

SELECT ID
FROM employees
WHERE ID NOT IN (
    SELECT manager_id
    FROM employees
    WHERE manager_id IS NOT NULL
);