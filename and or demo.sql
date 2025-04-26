select * from employees;

/*
   AND Operator :  
                  c1,c2,c3.....cn   : c1...cn-1  => true  , cn => false  =>false 
				  
                   C1     C2     R
				   T      F      F
				   F      T      F
				   F      F      F
				   T      T      T

  OR Operator :
                c1,c2,c3.....cn   : c1...cn-1  => FALSE  , cn => TRUE => true
                  C1       C2       R
				   T        F        T
				   F        T       T
				   F        F       F
				   T        T       T
   


*/
-- show details of all the employees whose salary is  less than 17k and they are from it programming 
select first_name as FirstName, last_name as LastName, email , salary,job_id as Department 
from employees where salary <=17000 and job_id='IT_PROG' 
-- show details of all the employees whose were hired after 2010 ,they are clerk or it_prog
select * from employees WHERE 
hire_date > '2010-12-31'
and
(
   job_id = 'IT_PROG' or job_id='ST_CLERK' or job_id='SH_CLERK' or job_id='PU_CLERK'
)
-- SHOW DETAILS OF ALL EMPLOYEES WHO WERE HIRE AFTER 2010 AND BEFORE 2020
Select * from employees where hire_date > '2010-12-31'
And hire_date<'2020-12-31';

select * from employees where hire_date between  '2010-12-31' and '2020-12-31'



--SHOW DETAILS OF ALL EMPLOYEES WHOSE MANAGER ID IS 103 or their job it is it_prog
select  *from employees where manager_id=103 or job_id='it_prog' ;
