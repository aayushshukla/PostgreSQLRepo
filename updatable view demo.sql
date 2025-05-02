/*
   updatable views : 
       views should be created using 1 table or 1 view.
	   the selection list must not contain any MAX , sum , min , count aggregate function
	   the query defining the view must not include
		    distinct
			with
			union
			intesect
			exclude
			limit
			group by
			having 
			limit
			offset


*/


create or replace view vw_order_myview_all as
select *
from orders
where ship_country in ('Brazil','US','Mexico','UK','India')

select * from vw_order_myview_all

-- add record in a view
insert into  vw_order_myview_all  (order_id,customer_id,employee_id) values (999,'HANAR',8)

-- no see updated information in view
select * from vw_order_myview_all
--  see updated information in table 
select * from orders

select * from employees;

select emp.first_name,emp.last_name,emp.title,o.order_id,o.customer_id,o.shipped_date,o.ship_city
from employees as emp
inner join orders as o
using (employee_id

create or replace view vw_order_employee_view as
select emp.first_name,emp.last_name,emp.title,o.order_id,o.customer_id,o.shipped_date,o.ship_city
from employees as emp
inner join orders as o
using (employee_id)

select * from vw_order_employee_view
-- error : views that do not select from a single table or view are not automatically updatable
update vw_order_employee_view set ship_city ='NY' where order_id=10248 -- because we have two table in view one order another is employee

