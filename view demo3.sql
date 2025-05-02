create or replace view vw_order_myview as
select order_id , customer_id, shipped_date,ship_city,ship_postal_code,ship_country 
from orders
where ship_country in ('Brazil','US','Mexico','UK','India')

select * from vw_order_myview
select * from orders;


alter table orders drop column productName

create or replace view vw_order_myview_all as
select *
from orders
where ship_country in ('Brazil','US','Mexico','UK','India')

-- now what will happen to view
select * from vw_order_myview_all

--change structure of table
alter table orders add column productName varchar(255)

select * from vw_order_myview_all



