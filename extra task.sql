use employees_mod;


# highest salary in employees_mod
select max(salary) as highest_sal from t_salaries;


# second highest salary using MAX
select max(salary) as second_highest_sal from t_salaries
where salary < (select max(salary) from t_salaries)
limit 10;


# second highest salary 2 using LIMIT
select salary from (select salary from t_salaries order by salary desc limit 2) as the2_sal order by salary limit 1;


# second highest salary 3 using TOP
# select TOP 1 salary from (select TOP 2 salary from t_salaries order by salary desc) as emp1 order by salary ASC;

select * from t_employees;

select e.first_name, e.emp_no, sum(s.salary), count(s.salary), avg(s.salary), min(s.salary), max(s.salary) from 
t_salaries s join t_employees e
on s.emp_no = e.emp_no
group by e.first_name, e.emp_no
limit 20;

