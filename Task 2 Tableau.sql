use employees_mod;

select * from t_employees
limit 10;

select * from t_dept_emp;

select * from t_dept_manager;

select * from t_departments;

## B.I Task 1

select year(d.from_date) as the_year, e.gender, count(e.emp_no) as amount_of_employee
from t_employees e join t_dept_emp d
on d.emp_no = e.emp_no
group by e.gender, the_year
having the_year >= 1990;


## B.I Task 2


select year(dm.from_date) as the_year, dm.dept_no, e.gender, count(dm.emp_no) as amount_of_managers
from t_dept_manager dm join t_employees e
on dm.emp_no = e.emp_no
group by the_year, e.gender, dm.dept_no
having the_year >= 1990;



## correct

select year(dm.from_date) as the_year, dp.dept_name, e.gender, count(dm.emp_no) as amount_of_managers
from t_dept_manager dm join t_employees e
on dm.emp_no = e.emp_no
join t_departments dp on dm.dept_no = dp.dept_no
group by the_year, e.gender, dp.dept_name
having the_year >= 1990;


