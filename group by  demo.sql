/*

Group by : it is used to group rows that have same values in specified columns into summary rows

it is commonly used with aggegrate functions 
count()
sum()
avg()
max()
min()

rule 1:  every column in the SELECT clause must be either
in the group by clause 
or an argument to an aggregate method 

rule 2: order matters : 1 . rows are grouped   2. aggregation is applied

*/

select * from employees;
select * from departments;

select sum(salary) as total_salary,max(salary) as max_salary ,min(salary) as min_salary, avg(salary) as average_Salary , 
count(employee_id)  as total_employees
from employees;

-- show no of employees deparment wise
select department_id, count(employee_id) as Number_Of_Emp_In_Dept
from employees
group by department_id


select emp.department_id,dept.department_name, count(emp.employee_id) as Number_Of_Emp_In_Dept
from employees as emp inner join departments as dept 
using(department_id)
group by department_id,dept.department_name
order by Number_Of_Emp_In_Dept desc

-- show the name of deparments having more than 20 employees

select emp.department_id,dept.department_name, count(emp.employee_id) as Number_Of_Emp_In_Dept
from employees as emp inner join departments as dept 
using(department_id)
group by department_id,dept.department_name
having  count(emp.employee_id) >20   -- having  filters groups 
order by Number_Of_Emp_In_Dept desc

