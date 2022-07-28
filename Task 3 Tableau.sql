use employees_mod;

# salary, gender, year, dept

# Correct solution
select e.gender, d.dept_name, Round(AVG(s.salary), 2) as salary, year(s.from_date) as calendar_year
from
t_employees e join t_salaries s on e.emp_no = s.emp_no
join t_dept_emp de on s.emp_no = de.emp_no
join t_departments d on de.dept_no = d.dept_no
Group by d.dept_no, e.gender, calendar_year
having calendar_year <= 2002
order by d.dept_no;
