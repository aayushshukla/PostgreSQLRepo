select * from coupons;

-- DML  :  Insert , Update , Delete 

--Insert : insert into tablename values (v1,v2,v3,...vn)   use this syntax if you want to give value to each column 

-- insert into table(col1,col2..coln) values (v1,v2.,..vn)

-- primary key : can not be null  and it unique

insert into coupons values (101,'infytest1',2.5,false,'2025-04-10',3.0)

--  insert into table(col1,col2..coln) values (v1,v2.,..vn)

insert into coupons(coupon_id,code,is_active,expiration_date,minimum_order) values (102,'infytest2',false,'2025-04-10',10.0)

-- insert muliple records insert into table(col1,col2..coln) values (v1,v2.,..vn),(v21,v22,v23..v2n),(v31,v32..v3n)

insert into coupons values 
(103,'infytest3',2.5,false,'2025-04-11',5.0),
(104,'infytest4',6.5,false,'2025-04-11',5.0),
(105,'infytest5',9.5,false,'2025-04-30',10.0);

-- use Returning to get info on return row
-- after the insert  let return all the rows   insert into tablename values (v1,v2,..) returning *
insert into coupons values (106,'infytest6',6.5,false,'2025-04-11',5.0) returning *;

insert into coupons values 
(107,'infytest3',2.5,false,'2025-04-11',5.0),
(108,'infytest4',6.5,false,'2025-04-11',5.0),
(109,'infytest5',9.5,false,'2025-04-30',10.0) returning *;

-- after the insert let return a single column value insert into tablename values (v1,v2,..) returning colname1,colname2...
insert into coupons values 
(110,'infytest8',2.5,true,'2025-05-11',5.0),
(111,'infytest9',6.5,true,'2025-05-11',5.0) returning coupon_id,is_Active;




