/* count how many rows are on the tables of data base*/
SELECT table_name, table_rows FROM information_schema.tables WHERE table_schema = 'employees'
/* how many employees with first_name Mark*/
SELECT COUNT(*) FROM employees WHERE first_name = 'Mark' 
/* how many employees with first_name Eric and last_name starts with 'A' table with rows*/
SELECT first_name , last_name FROM employees WHERE first_name = 'Eric' AND last_name LIKE 'A%'
/* how many employees with first_name Eric and last_name starts with 'A', sum of employees*/ 
SELECT COUNT(*) FROM employees WHERE first_name = 'Eric' AND last_name LIKE 'A%'
/* How many employees do we have that are working for us since 1985 and who are they */
SELECT first_name , last_name, hire_date FROM employees WHERE hire_date > '1984-12-31' AND hire_date < '1986-01-01'

SELECT first_name , last_name, hire_date FROM employees WHERE hire_date BETWEEN '1985-01-01' AND '1985-12-31'
/* How many employees got hired from 1990 until 1997 and who are they */
SELECT first_name , last_name, hire_date FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1997-12-31'
/* How many employees have salaries higher than EUR 70 000,00 and who are they?*/
select distinct employees.emp_no, employees.first_name, employees.last_name
from employees
INNER JOIN salaries
on salaries.emp_no = employees.emp_no
WHERE salary > 70000
ORDER BY `employees`.`salaries` ASC
/* How many employees have salaries higher than EUR 70 000,00 and who are they? including salary height*/
select distinct employees.emp_no, employees.first_name, employees.last_name, salaries.salary
from employees
INNER JOIN salaries
on salaries.emp_no = employees.emp_no
WHERE salary > 70000
ORDER BY `employees`.`emp_no` ASC
/* How many employees do we have in the Research Department, who are working for us since 1992 and who are they? */
select distinct dept_emp.dept_no, dept_emp.from_date, employees.first_name, employees.last_name
from employees
INNER JOIN dept_emp
on dept_emp.emp_no = employees.emp_no
WHERE from_date BETWEEN '1992-01-01' AND '2020-11-05'
ORDER BY `employees`.`emp_no` ASC
/*How many employees do we have in the Finance Department, who are working for us since 1985 until now and who have salaries higher than EUR 75 000,00 - who are they?*/
select dept_emp.dept_no, dept_emp.from_date, employees.first_name, employees.last_name, salaries.salary
from employees
INNER JOIN dept_emp on dept_emp.emp_no = employees.emp_no
INNER JOIN salaries on salaries.emp_no = employees.emp_no
WHERE dept_emp.from_date BETWEEN '1985-01-01' AND '2020-11-05'
AND salaries.salary > 75000
GROUP BY `employees`.`emp_no` 
