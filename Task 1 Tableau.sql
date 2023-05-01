use employees_mod;



## Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990. 

select * from t_employees
limit 10;

select * from t_dept_emp
limit 10;

select Year(d.from_date) as calendar_year, e.gender, count(e.emp_no) as no_of_employees
from 
t_employees e
join
t_dept_emp d
on d.emp_no = e.emp_no
group by calendar_year, e.gender
having calendar_year >= 1990;
