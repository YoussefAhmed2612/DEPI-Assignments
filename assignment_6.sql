-- Task 1: Using Comparison and Logical Operators
-- Question:
-- Write a SQL query to retrieve the emp_id, last_name, and salary of employees whose salary is 
-- between 2,000 and 5,000 and do not have a manager ID of 101 or 200.

SELECT emp_id, last_name, salary
FROM employees
WHERE salary BETWEEN 2000 AND 5000
  AND manager_id NOT IN (101, 200);

-- Task 2: Using JOINs and Aliases
-- Question:
-- Write a SQL query to display the employee names along with their respective department names. 
-- Use aliases for table names for better readability.

SELECT e.name AS employee_name, d.name AS department_name
FROM employees e
INNER JOIN departments d
  ON e.dept_id = d.id
ORDER BY d.name ASC;

-- Task 3: Aggregate Functions and GROUP BY
-- Question:
-- Write a SQL query to find the number of employees and the average salary for each department. 
-- Ensure that the results are grouped by department ID.

SELECT dept_id, 
       COUNT(*) AS employee_count, 
       AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id;
