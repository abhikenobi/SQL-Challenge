-- Check to see if import were sucessful
SELECT * FROM employees;

SELECT * FROM titles;

SELECT * FROM departments;

SELECT * FROM dept_emp;

SELECT * FROM dept_manager;

SELECT * FROM salaries;

-- 1. List the following details of each employee:
-- employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM salaries s
LEFT JOIN employees e
ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for
-- employees who were hired in 1986.

-- Wildcard not working
-- SELECT first_name, last_name, hire_date
-- FROM employees
-- WHERE hire_date LIKE '1986%';

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
-- ORDER by hire_date DESC;
--^ Checks the date parameters

-- 3. List the manager of each department with the following
-- information: department number, department name,
-- the manager's employee number, last name, first name.

-- Double inner joins needed
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN departments d
ON dm.dept_no = d.dept_no
INNER JOIN employees e
ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following
-- information: employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN employees e
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON d.dept_no = de.dept_no;

-- 5. List first name, last name, and sex for employees
-- whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their
-- employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN employees e
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN employees e
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of
-- employee last names, i.e., how many employees share each
-- last name.

SELECT last_name, COUNT(last_name) AS "frequency count"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;