-- assign variable from query
-- select statement into variablename
-- must return a single result
select *  from employees;

DO
 $$
    declare 
        fn varchar(20);
	begin
       select first_name from employees
	   into fn
	   where employee_id=1;

	   raise notice 'employee first name is %',fn;

	end;


 $$


DO
 $$
    declare -- i dont know the data type of column
        fn employees.first_name%TYPE; -- dynamic typing
	begin
       select first_name from employees
	   into fn
	   where employee_id=1;

	   raise notice 'employee first name is %',fn;

	end;


 $$

-- access full row from the data 
-- we will use variable with 'record ' data type    variablename record

DO
 $$
    declare 
        emp_info record ; 
	begin
       select * from employees
	   into emp_info
	   where employee_id=1;

	   --raise notice 'employee info is %',emp_info; -- recordname.columnname
	   raise notice 'employee firstname = %  \n lastname =% \n title = %',emp_info.first_name,emp_info.last_name,emp_info.title;

	end;


 $$

