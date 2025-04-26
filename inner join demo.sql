/*
     select  tablename1.column1,table2.column2,table2.columnname ... from table1name joinname table2name 
	 on table1column = table2column 
	 where condition 
	 order by 

 */

select * from employees;
select * from departments;

--show departmentname  for each and every employee
select emp.first_name,emp.last_name,emp.department_id,dept.department_name
from employees as emp
inner join departments as dept
on emp.department_id = dept.department_id

select * from jobs;
select * from job_history;

-- show start date and end date of each employee show their max and min salary
select emp.employee_id, emp.first_name,emp.last_name,jh.start_date,jh.end_date,emp.job_id,jb.min_salary,jb.max_salary
from employees as emp
inner join job_history as jh
on emp.employee_id = jh.employee_id
inner join jobs as jb
on emp.job_id =jb.job_id

 