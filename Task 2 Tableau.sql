use employees_mod;

select * from t_employees
limit 10;

select * from t_dept_emp;

select * from t_dept_manager;

select * from t_departments;

## B.I Task 1
## Compare the number of male managers to the number of female managers from different departments for each year
## starting from 1990
# Real Answer below

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

## not correct

select year(dm.from_date) as the_year, dp.dept_name, e.gender, count(dm.emp_no) as amount_of_managers
from t_dept_manager dm join t_employees e
on dm.emp_no = e.emp_no
join t_departments dp on dm.dept_no = dp.dept_no
group by the_year, e.gender, dp.dept_name
having the_year >= 1990;

## ALL ABOVE IS WRONG FOR THE B.I TASK2


## B.I Task 1
## Compare the number of male managers to the number of female managers from different departments for each year
## starting from 1990

SELECT d.dept_name, ee.gender, dm.emp_no, dm.from_date, dm.to_date, e.calendar_year,
	CASE
		WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
		ELSE 0
	END AS active
FROM
	(SELECT 
		YEAR(hire_date) AS calendar_year
	FROM
		t_employees
	GROUP BY calendar_year) e
		CROSS JOIN t_dept_manager dm
        JOIN t_departments d ON dm.dept_no = d.Dept_no
        JOIN t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;
        

## just checking the subquery from above
Select * FROM
	(SELECT 
		YEAR(hire_date) AS calendar_year
	FROM
		t_employees
	GROUP BY calendar_year) e
		CROSS JOIN t_dept_manager dm
        JOIN t_departments d ON dm.dept_no = d.Dept_no
        JOIN t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;


		
