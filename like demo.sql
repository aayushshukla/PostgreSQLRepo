/*

LIKE : to matach a pattern 

   % : represents 0 , 1 or n characters
   _ : exact single character

*/
select * from employees;
-- show all the employees name that starts with D
select first_name, email  from employees where first_name like 'D%'

-- show all the employees name that contains nie
select first_name,email from employees where first_name like '%nie%'

--show name of all the employees ending with er
select first_name,email from employees where first_name like '%er'

select first_name,email from employees where first_name like 'O_____'

select first_name,email from employees where first_name like 'O__v_r'

select first_name,email from employees where first_name like 'O__v%'