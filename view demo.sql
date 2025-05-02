/*
   view is stored sql query (database object ) that act like virtual table.
   In normal view data of query is not stored 

   simplify complex queries 
   resuse sql logic
   data security (show only part of table)
   improve code maintain

   create or replace view viewname as
      query 
	   select * from order where ship_city = 'Lyon'
*/
-- create view
create view vw_order_myview as
select order_id , customer_id, shipped_date,ship_city,ship_postal_code,ship_country 
from orders
where ship_country in ('Brazil','US','Mexico','UK')

-- getting data from view
select * from vw_order_myview

-- 
insert into orders (order_id , customer_id, shipped_date,ship_city,ship_postal_code,ship_country) values 
(9999,'HANAR','2025-05-01','NY','0940202','US')

update orders set ship_postal_code='560102'   where order_id=9999


--explain analyze select * from vw_order_myview

--explain analyze select order_id , customer_id, shipped_date,ship_city,ship_postal_code,ship_country 
--from orders
--where ship_country in ('Brazil','US','Mexico','UK')


create or replace view vw_order_myview as
select order_id , customer_id, shipped_date,ship_city,ship_postal_code,ship_country 
from orders
where ship_country in ('Brazil','US','Mexico','UK','India')

select * from vw_order_myview

-- drop view 
-- drop view [if exists] viewname1,viewname2,....n [cascade | restrict]
-- cascade removes dependent object along with the view
--restrict  reject the removal of view if other object depend on view . Restrict is default 

drop view if exists vw_order_myview
