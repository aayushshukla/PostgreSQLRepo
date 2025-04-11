-- copy table stucture + data

'''
    create table newtablename as  select * from originaltable  Indexes and constrainsts are not copied
'''

--select * from users;

create table users_copy as select * from users;

select * from users_copy

--copy table structure only    syntax :   create table newtablename as  select * from originaltable where false
-- it will copy the columns without rows  .Indexes and constrainsts are not copied

create table users_copy1 as select * from users where false 

select * from users_copy1

-- copy stucture including constraints etc 
--  create table newtablename (LIKE originaltable including all )  
'''
    Including all  ensures the new table copy : columns , data types , constrainst , default , indexes , storage setting 
'''

create table users_copy2 (LIKE users including all)

-- copy data into existing table   Syntax : Insert into newtablename select * from originaltable

Insert into users_copy1 select * from users;


-- drop table drop table tablename

drop table users_copy1;

-- avoid error when table doesnt exist   syntax : drop table if exists tablename

drop table if exists  users_copy1;

-- drop multiple tables   drop table if exists table1, table2...

drop table if exists users_copy1,users_copy2,users_copy;

-- drop dependent objes   :  drop table tablename cascade

-- view schema + table details

select * from information_schema.columns 

select * from information_schema.columns  where  table_name ='users'


select column_name,data_type, is_nullable , column_default from information_schema.columns  where  table_name ='users'









