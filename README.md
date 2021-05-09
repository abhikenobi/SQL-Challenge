# SQL-Challenge

![SQL icon](/EmployeeSQL/ERD/sql%20logo.png)

---
## Background
It is a beautiful spring day, and it has been two weeks since I have been hired as a new data engineer at Pewlett Hackard. My first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remain of the databases of employees from that period are six CSV files.

In this assignment, you will design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. In other words, you will perform:

1. Data Modeling

- Inspecting the CSVs and sketching out an ERD of the tables.

2. Data Engineering

- Using the information I have to create a table schema for each of the six CSV files.
- Importing each CSV file into the corresponding SQL table.

3. Data Analysis

Once the database was completed, the following analysis had to be perfomed:

- List the following details of each employee: employee number, last name, first name, sex, and salary.
- List first name, last name, and hire date for employees who were hired in 1986.
- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
- List the department of each employee with the following information: employee number, last name, first name, and department name.
- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
- List all employees in the Sales department, including their employee number, last name, first name, and department name.
- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

---
## ERD Modeling (Entity Relationship Diagram)

![ERD Diagram](/EmployeeSQL/ERD/QuickDBD-export.png)

> [Quick Database Diagrams](https://app.quickdatabasediagrams.com/#/d/XYuyVN) was used in order to create the ERD shown above

---
## Engineering

Using the ERD above, a [schema](/EmployeeSQL/Script/employee_schema.sql) was built using the following code:

```sql
CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    PRIMARY KEY ("title_id")
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR   NOT NULL,
    "birth_data" date   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" date   NOT NULL,
	FOREIGN KEY ("emp_title") REFERENCES titles ("title_id"),
	PRIMARY KEY ("emp_no")
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    PRIMARY KEY ("dept_no")
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
	FOREIGN KEY ("dept_no") REFERENCES departments ("dept_no"),
	FOREIGN KEY ("emp_no") REFERENCES employees ("emp_no"),
    PRIMARY KEY ("emp_no", "dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
	FOREIGN KEY ("dept_no") REFERENCES departments ("dept_no"),
	FOREIGN KEY ("emp_no") REFERENCES employees ("emp_no"),
    PRIMARY KEY ("dept_no", "emp_no")
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
	FOREIGN KEY ("emp_no") REFERENCES employees ("emp_no"),
    PRIMARY KEY ("emp_no")
);
```
---
## Analysis
The following solutions can be found in the saved [query file](/EmployeeSQL/Script/employee_query.sql).
1. Required data from the employees and salaries tables
```sql
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM salaries s
LEFT JOIN employees e
ON e.emp_no = s.emp_no;
```
2. Used a WHERE statment.
```sql
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
```
3.
