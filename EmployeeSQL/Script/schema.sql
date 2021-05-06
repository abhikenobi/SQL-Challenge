-- Drop any existing tables with the same names as below
DROP TABLE IF EXISTS employees, dept_emp, departments, dept_manager, titles, salaries CASCADE; 

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


