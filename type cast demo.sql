select * from orders;

/*
    CAST : convert one type into another type
	 2 common ways
	     i) :: --> cast operator   -->  value :: target_type 
		 ii)cast function   --  cast (value as target_type)


*/
insert into orders values (101,1,1,'2025-04-23','completed','2025-04-23',500.50),
(121,1,1,'2025-04-23','completed','2025-04-23',300.00),
(131,1,1,'2025-04-23','pending','2025-04-23',400)

select * from orders;

select cast(order_date as date) from orders;
select cast ('2024-12-9' as date) -- converting string into date format

select total_price from orders;
select cast(total_price as integer) from orders;  -- convert decimal into integer format
select total_price::integer from orders;
select cast('true' as Boolean)  -- converting string into boolean

select cast('2025-04-23 19:40:20' as timestamp)  -- converting string into timezone
select '2025-04-23 19:40:20'::timestamp

select '19 hours' :: interval as hours , '40 minutes' :: interval as minutes, '3 weeks':: interval as weeks

select cast('2025-04-23 19:40:20' as date) as conversion_to_Date

select cast ('3 weeks' as text) -- converting interval to text 
