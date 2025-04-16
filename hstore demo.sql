/*

HSTORE :
     stores data in to key value pairs .Key values are strings only
	 * the hstore module implements the hstore data type
	 We can use this wen we want lightweight , schema less stucture but dont need complexity of JSON

      Example : tags , metadata 
	  we can use hstore when we dont need nesting or arrays 
*/

-- install hstore extension
create extension if not exists hstore
-- 
create table tb_hstoredemo
  (
     productId serial primary key,
	 productName varchar(200),
	 productDetails hstore
  )
-- when we write HSTORE we starts with '' . 
-- keys and values must be written using "key" => "values"
insert into tb_hstoredemo (productName,productDetails)
values
('parleG',
 '
  "category" => "biscuit",
  "price" => "5 inr",
  "company" => "Parle"
 
 ') returning *

 insert into tb_hstoredemo(productName,productDetails) values
 ('Lays',
   '
      "category" => "chips",
	  "price" =>"20",
	  "company" =>"PepsiCo"
   
   '
  ) returning *

 -- get the data
 select productdetails from tb_hstoredemo

 -- get values for a specific key  we can use ->
 select 
   productdetails -> 'company'as companyInfo from tb_hstoredemo
-- get the product where price is 20 rs
 select productName from tb_hstoredemo where productdetails ->'price' = '20'
-- add new key value pair to existing rows 
-- || we use for concat strings 
 update tb_hstoredemo set productdetails =  productdetails || ' "exp_date" => "2025-06-10" ':: hstore where productName = 'Lays'
-- data of the row will be override 
 update tb_hstoredemo set productdetails =   ' "mfg_date" => "2024-06-10" ':: hstore where productName = 'Lays'

 -- update existing key value pait
 update tb_hstoredemo  set productdetails = productdetails || '"category" => "snacks" '::hstore  where productdetails  -> 'company' = 'PepsiCo'
 -- remove existing key value pair  update tablename set hstorecolumn = delete(columnnane,keyname)
 update tb_hstoredemo set productdetails = delete (productdetails,'mfg_date')

 -- check a key is present in hstore column  : we use ? operator in the where clause to check a specific key in hstore
 select * from tb_hstoredemo where productdetails ? 'price'

  select * from tb_hstoredemo where productdetails ? 'mfg_date'  -- empty 

-- check for key value pair   for this we use @> operator .It will fetch all the rows which have mentioned key value pair
select * from tb_hstoredemo where productdetails @> '"price" => "5 inr"' :: hstore

-- fetch record that contains multiple specified keys  for this we use ?& operator
select * from tb_hstoredemo where productdetails ?&  array ['price','category','exp_date']

-- get all the keys from a hstore column : we use  akeys(columnname) fucntion
select akeys(productdetails) from tb_hstoredemo

-- get all the values from a hstore column : we use  avals(columnname) fucntion
select avals(productdetails) from tb_hstoredemo
-- to get result as set use svals(columname)
select svals(productdetails) from tb_hstoredemo

-- convert hstore into json
select productName,hstore_to_json(productdetails) json  from tb_hstoredemo


 

 
