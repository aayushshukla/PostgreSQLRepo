--Update record update tablename set columname = newvalue , columnname2=value , ... where condition 
select * from coupons;

update coupons set discount_percentage=7.5 where coupon_id=102

-- update discount_percentage to 7.5 , isactive to true and minimum order to 15 where my coupon name is infytest5
update coupons set discount_percentage=7.5 ,is_active =true,minimum_order =15.0 where code ='infytest5' 

-- use returning to display all the records updated

update coupons set discount_percentage=8.5 ,minimum_order =12.0 where code ='infytest6' returning *

-- returning a columnname

update coupons set discount_percentage=5.5 ,minimum_order =8.0 where code ='infytest3' returning code,expiration_date,minimum_order

-- 
update coupons set expiration_date = '2025-11-30' where discount_percentage=6.5 and minimum_order =5.0 returning *

-- remove a particular record 
-- delete from tablename where conditon 
delete from coupons where minimum_order < 5.0

delete from coupons where discount_percentage < 5.0 returning *

