use employees_mod;

select * from t_employees
limit 10;

select * from t_dept_emp;

select * from t_dept_manager;

select * from t_departments;


## B.I Task 2

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


		
