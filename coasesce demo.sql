/*
    COALESCE()  accept a list of argument and returns first not null value
	COASLESCE(arg1,agr2...agrn)  return the first not null argument 
	Scan from left to right for not null value


*/
select COALESCE('A','B'); -- BOTH ARGUMENTS ARE NOT NULL  IT WILL RETURN FIRST NOT NULL VALUE .

select COALESCE(NULL,'A','B')

select COALESCE(NULL,NULL,NULL) 

select * from orders;

insert into orders values (111,1,1,'2025-04-23','completed','2025-04-23',NULL);
-- select * from tablename -- if we want to get all the data
-- select col1,col2.. from table - fetch data from specific columns
-- select colname as aliasname , col2 as aliasname from table : aliasname is only for view purpose not change will done to actual column name
select order_id as orderId,user_id as  userdetail ,(total_price-50) as new_price from orders

select order_id,user_id as userdetail, 
( COALESCE(total_price,0) - 50 )  as new_price
 from orders

