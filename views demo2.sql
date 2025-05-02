/*
  create or replace view vw_order_myview as
select order_id , customer_id, shipped_date,ship_city,ship_postal_code,ship_country 
from orders
where ship_country in ('Brazil','US','Mexico','UK','India')


*/

-- security
-- create a user 
create role pappu
login
password '2000'

--grant permission 
-- grant satement1,statemet2 on table to user
grant select on orders to pappu

--grant select,insert,update,delete on orders to pappu
-- Give all permission on all tables - grant all previliges on all tables in schema shema_name to user


create or replace view vw_order_myview as
select order_id , customer_id, shipped_date,ship_city,ship_postal_code,ship_country 
from orders
where ship_country in ('Brazil','US','Mexico','UK','India')

select * from vw_order_myview

grant select on vw_order_myview to pappu  -- grant permission to execute view to username as pappu

alter view vw_order_myview rename column shipped_date to shipping_date
alter view vw_order_myview rename to vw_order_orderview

select * from vw_order_orderview