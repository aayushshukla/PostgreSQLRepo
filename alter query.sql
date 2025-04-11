create table coupons 
 (
    coupon_id integer primary key,
	code  text ,
	discount_percentage decimal(2,1),
	is_active boolean
	
 )

-- add column  
/*
     alter table tablename  add column columnname datatype column_constraint


*/

select * from coupons;

alter table coupons add column expiration_date date;

-- add column name as minimum_order decimal 

alter table coupons add column  minimum_order decimal (3,1);

-- set not null constraint   syntax :  alter table tablename alter column columnname [set not null | drop not null]
alter table coupons alter column expiration_date set not null

alter table coupons alter column minimum_order set not null;

-- add defualt :  alter table tablename alter column columname [set default value | drop default]

alter table coupons alter column is_active set default FALSE

-- SET Minimum order as 2.0 

alter table coupons alter column minimum_order set default 2.0
-- drop default 
alter table coupons alter column minimum_order drop default

alter table coupons add column  remarks text;

select * from coupons;

-- rename a column  alter table tablename rename column columnname to newcolumnname

alter table coupons rename remarks to coupon_description

-- drop a column  alter table drop column columname 

alter table coupons drop column coupon_description

-- rename table  alter table tablename rename to newtablename

alter table coupons  rename to user_coupons;

select * from user_coupons;

alter table user_coupons  rename to coupons;

select * from coupons;

-- change data type of column alter table tablename alter column columnname type newdatatype

alter table coupons alter column is_active type text

-- change text to boolean : suing clause we use for complex conversion
alter table coupons alter column is_active type boolean using is_active::boolean





