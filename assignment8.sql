
-- Task 1: Using Date and Time Functions
-- Question:
-- Write a SQL query to retrieve all employees who were hired within the last 30 days from the 
-- current date.

SELECT *
FROM employees
WHERE hire_date >= CURRENT_DATE - INTERVAL '30 days';

-- Task 2: Creating and Using a Stored Procedure
-- Question:
-- Create a stored procedure named sp_get_employee_hours that retrieves the first name, last 
-- name, and total hours worked on projects for a given employee ID.

CREATE PROCEDURE sp_get_employee_hours(IN emp_id INT)
BEGIN
    SELECT e.fname, e.lname, SUM(w.hours) AS total_hours
    FROM employees e
    INNER JOIN works_on w
      ON e.ssn = w.essn
    WHERE e.id = emp_id
    GROUP BY e.fname, e.lname;
END;

-- Task 3: Creating a Stored Procedure for Employee Count by Department
-- Question:
-- Create a stored procedure named sp_department_employee_count that retrieves the 
-- department ID, department name, and the number of employees in each department, but only for 
-- departments with more than 5 employees.

CREATE PROCEDURE sp_department_employee_count()
BEGIN
    SELECT d.id AS department_id, d.name AS department_name, COUNT(e.id) AS employee_count
    FROM departments d
    INNER JOIN employees e
      ON d.id = e.dept_id
    GROUP BY d.id, d.name
    HAVING COUNT(e.id) > 5;
END;
