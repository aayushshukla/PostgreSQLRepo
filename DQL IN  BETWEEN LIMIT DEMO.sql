select * from employees;
/*

  select  columnlist 
  from tablename
  order by 
     epression [ASC | DESC ] [NULLS FIRST | NULLS LAST ]  by default it will asc 

   from -->  select --> order by 

   between low and high

   not between low and high

*/
-- sort all employees on basis of their salary
select * from employees order by salary 

-- sort all employees on basis of their salary in escending 
select * from employees order by salary desc

-- show the employee name with highest salary
select first_name,last_name,salary from employees order by salary desc limit 1

-- show top 10  employees  with high salary
select * from employees order by salary desc limit 10
-- sort rows by multiple column
select
   first_name,
   last_name
   from employees 
   order by first_name asc,
   last_name desc

-- find all the employees that salary between 12000 to 17000

select first_name,last_name,salary from employees where salary between 12000 and 17000

select first_name,last_name,salary from employees where salary between 12000 and 17000 order by  salary desc

-- not between 
-- show all the employees whose salary is not in range of 12000 to 17000

select first_name,last_name,salary from employees where salary not between 12000 and 17000 order by  salary desc

select first_name,last_name,salary from employees where salary not between 12000 and 17000 order by  salary desc limit 10

select first_name,last_name,salary from employees where salary not between 12000 and 17000 order by  salary desc limit 10 offset 2

select * from employees;

-- show employees after 50 rows
select * from employees limit 57 offset 50

--IN Operator  it allows us to check whether a value matches with any value in list or not  coulmnname in ('v1','v2')

-- show name and salary of all the employees who are from job related to accounts
select first_name as FirstName , last_name as LastName ,salary as Salary ,job_id as Designation from employees where job_id in ('AC_MGR','AC_ACCOUNT')

-- show all the people who are not clerk or reception
select first_name as FirstName , last_name as LastName ,salary as Salary ,job_id as Designation from employees where job_id not in ('SA_REP','ST_CLERK','PU_CLERK','SH_CLERK',
'HR_REP','PR_REP')


