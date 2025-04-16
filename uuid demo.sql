/*
   UUID  universal unique  identifier (RFC 4122)

   it is 128 bit quantity genererated by an algo that makes it unique in the know universe using the same algo

   Length will be 32  hexadecimal (0-9,10-A,11-B,12-C,13-D,14-E,15-F) digits . 
   It will separated by -.
   

   * To create UUID data type we need to a 3rd party algo to generate UUID  EG : uuid-ossp


*/
-- generate UUID value 
select gen_random_uuid()  -- new version
select uuid_generate_v4()
select uuid_generate_v1()
---------------------------------------------------old version -------------------------------------------------------------------
-- enable 3rd party UUID extension
create extension if not exists  "uuid-ossp" -- it was in old version

-- create table 
create table tb_uuiddemo
   (
      product_key UUID default uuid_generate_v4(),
	  productName varchar(200)
   )

 insert into tb_uuiddemo (productName) values ('windows 11 home'),('windows 11 pro') , ('windows 11 enterprise')

 select * from tb_uuiddemo
 ---- change UUID default value
 alter table tb_uuiddemo alter column product_key set default gen_random_uuid()
------------------new version-------------------------------------------------------------------------------------------

 create table tb_uuiddemo1
   (
      product_key UUID default gen_random_uuid(),
	  productName varchar(200)
   )

 insert into tb_uuiddemo1 (productName) values ('windows 11 home'),('windows 11 pro') , ('windows 11 enterprise')

 select * from tb_uuiddemo1

 
