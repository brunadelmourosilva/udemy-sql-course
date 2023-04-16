
create database window_func;
use window_func;

create table employees(
	emp_no int primary key auto_increment,
	departament varchar(20),
	salary int
)

alter table employees rename column departament to department


-- WINDOW FUNCTIONS
-- perform aggregate operations on group of rows(like group by),
-- BUT they produce a result FOR EACH ROW.

-- OVER FUNCTION

	-- without over function
select AVG(salary) from employees

select MIN(salary), MAX(salary) from employees;

	-- with over function
select emp_no, department, salary, AVG(salary) over() from employees

select emp_no, department, salary,
min(salary) over(),
max(salary) over()
from employees 


-- PARTIION BY 

	-- the average salary for each department and by the whole company
select emp_no, department, salary, 
avg(salary) over(partition by department) as department_avg,
avg(salary) over() as company_avg
from employees

	-- the average of people per department
select emp_no, department, salary,
count(*) over(partition by department) from employees

	-- the payroll total per department and by the whole company
select emp_no, department, salary,
sum(salary) over(partition by department) as department_payroll,
sum(salary) over() as company_payroll
from employees

	-- a similar thing using group by, but not showing all the rows
select department,
sum(salary) as department_payroll
from employees 
group by department


-- ORDER BY WITH WINDOW function 

SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min
FROM employees;


-- RANK

select emp_no, department, salary,
rank() over(partition by department order by salary desc) department_salary_rank,
rank() over(order by salary desc) as overall_salary_rank
from employees order by department

-- NTILE

SELECT 
    emp_no, 
    department, 
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
	NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;


-- FIRST VALUE

SELECT 
    emp_no, 
    department, 
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall
FROM employees;


-- LEAD AND LAG

SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_diff
FROM employees;




