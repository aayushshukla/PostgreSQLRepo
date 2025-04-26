select * from product;
select * from inventory;

-- full outer join

select p.pid,p.pname,iv.invid,iv.price,iv.pid
from product as p
full outer join inventory as iv
on p.pid =iv.pid
where pname is null


--- cross join
select * from product 
cross join inventory

-- self join
/*
   select columnnames  from tablename1 table1 inner join  tablename1 t2 on  joinpredicate

*/

select * from employees;

select emp.first_name || ' ' || emp.last_name as EmployeeName,
man.first_name || '  '|| man.last_name Manager
from employees as emp
inner join employees as man 
on emp.employee_id = man.manager_id 
order by EmployeeName

-- left join for self join 
select emp.first_name || ' ' || emp.last_name as EmployeeName,
man.first_name || '  '|| man.last_name Manager
from employees as emp
left join employees as man 
on emp.employee_id = man.manager_id 
order by EmployeeName