select * from order_details;

explain select * from order_details;
--lsit of indexes
select indexname,indexdef from pg_indexes where tablename ='order_details'

create index idx_order_details_quantity on order_details(quantity)

select unit_price,quantity from order_details where quantity =5

explain select unit_price,quantity from order_details where quantity =5

/*
   explain : 
       it will show query execution plan 

	   show the lowest cost among evaluted plans

	   will not execute the statement your enter , just show query only 

	   show you the execution nodes that the executor will use to provide you with the dataset

	   -- execution node  ---> scan type | execution node table
	   -- every node :
	            cost : work done by postgresql 
				     start up cost : how much work PostgreSQL has to do before it begins the execution of query 
					 end cost : how much effort PostgreSQL has to do to provide last bit of the data 
				rows : how many rows/tuples the node is expected to provide in final result 
				width : it average of how many  bits every rows will occupy 
					 
	    

*/

-- drop index  drop index [ concurrently | if exists] index_name [cascade| restrict]
-- cascade all dependent objects will be deleted
-- restrict - postgresql will deni to drop index if any object is dependent

drop index if exists idx_order_details_quantity

--multi column index  : always write most frequently use one first and others 
create index idx_order_details_discount_unit on order_details(discount,unit_price)

explain select discount,quantity from order_details where discount =0 and unit_price =2.5

--hash index, gist ,gin

drop index if exists idx_order_details_quantity
-- creating hash index
create index idx_order_details_quantity on order_details using hash (quantity)
-- create index idx_order_details_quantity on order_details using gin (quantity)
-- create index idx_order_details_quantity on order_details using gist (quantity)
explain select unit_price,quantity from order_details where quantity =5

