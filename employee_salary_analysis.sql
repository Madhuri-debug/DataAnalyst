-----Create Database:

CREATE DATABASE employee_analysis;

----USE Database:

USE employee_analysis;

----Create table:

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary INT,
    experience INT
);

----Insert data:

INSERT INTO employees VALUES
(1,'Rahul','IT','Hyderabad',65000,3),
(2,'Sneha','HR','Chennai',45000,2),
(3,'Arjun','Finance','Bangalore',70000,4),
(4,'Priya','IT','Hyderabad',80000,5),
(5,'Kiran','Sales','Mumbai',50000,2),
(6,'Divya','Finance','Chennai',72000,4),
(7,'Vikas','IT','Pune',90000,6),
(8,'Anjali','HR','Bangalore',47000,3),
(9,'Ravi','Sales','Mumbai',52000,2),
(10,'Meena','IT','Hyderabad',85000,5);

----Verify:

SELECT * FROM employees;

----Department average salary:

SELECT department, AVG(salary)
FROM employees
GROUP BY department;

----Above-average employees:

SELECT emp_name, salary
FROM employees
WHERE salary > (
SELECT AVG(salary)
FROM employees
);

----Salary ranking:

SELECT emp_name,
department,
salary,
RANK() OVER(ORDER BY salary DESC) AS rank_no
FROM employees;

----Top employee in each department:

SELECT *
FROM
(
SELECT emp_name,
department,
salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) rnk
FROM employees
) x
WHERE rnk = 1;