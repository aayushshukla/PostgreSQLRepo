/*
   Natural Join : it creates an implicit join based on same column names in the joined tables.

   select columnnames from table1
   Natural [Iner , left ,right] join tablename2

*/

select * from employees;
select * from departments;
select * from jobs;

select emp.first_name , emp.last_name,emp.employee_id,dept.department_name
from employees as emp
natural inner join departments as dept

select emp.first_name , emp.last_name,emp.employee_id,dept.department_name
from employees as emp
 inner join departments as dept 
on emp.department_id = dept.department_id

select emp.first_name , emp.last_name,emp.employee_id,jb.job_title
from employees as emp
natural inner join jobs as jb

select emp.first_name , emp.last_name,emp.employee_id,jb.job_title
from employees as emp
inner join jobs as jb
on emp.job_id = jb.job_id

--USING  in joins  : when both tables have column with the same name .It is more shorter and cleaner
-- it works with inner join , left , right , full outer join
-- ** column name should be same in joining tables 

select emp.first_name , emp.last_name,emp.employee_id,jb.job_title
from employees as emp
inner join jobs as jb
using(job_id)


select emp.first_name , emp.last_name,emp.employee_id,dept.department_name
from employees as emp
 inner join departments as dept 
using(department_id)

 --for multi column
 select emp.first_name , emp.last_name,emp.employee_id,dept.department_name
from employees as emp
 inner join departments as dept 
using(department_id,manager_id)