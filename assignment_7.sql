-- Task 1: Creating a Simple View
-- Question:
-- Create a simple view named vw_employee_details that displays the first name, last name, and 
-- department name of employees.

CREATE VIEW vw_employee_details AS
SELECT e.fname, e.lname, d.dname
FROM employees e
INNER JOIN departments d
  ON e.dept_id = d.id;

-- Task 2: Modifying a View
-- Question:
-- Modify the existing view vw_work_hrs to only include employees working in department 
-- number 5.

CREATE OR REPLACE VIEW vw_work_hrs AS
SELECT e.fname, e.lname, p.pname, w.hours
FROM employees e
INNER JOIN work_hours w
  ON e.id = w.emp_id
INNER JOIN projects p
  ON w.project_id = p.id
WHERE e.dept_id = 5;

-- Task 3: Creating Views with Check Option
-- Question:
-- Create a view named vw_high_status_suppliers to display all suppliers with a status greater 
-- than 15, and ensure that any updates or inserts through the view still meet the status condition.

CREATE VIEW vw_high_status_suppliers AS
SELECT *
FROM suppliers
WHERE status > 15
WITH CHECK OPTION;
