-- Alter table tablename add constraint constraint_name  ConstrainName (columnn)

/*

  Boolean   : can have 3 values   TRUE , FALSE  AND Null

				Other valid literals for boolean value .
				-- must be written in single quotes except TRUE , FALSE 
				True        FALSE
				'true'      'false'
				't'          'f'
				'y'          'n'
				'yes'        'no'
				'1'          '0'
				
  Character :  CHARACTER(n)  char(n)  : fixed length  , blank padding  ex : char(4) => 'abcd'  or  "a   "  
               varchar(n) or character varying(n)   :   variable length with length limit  ex :  'a'
			   text                                 :   variable unlimited length

*/
-- Autoincrement in postgresql  we use SERIAL  or Identity(Postgresql 10)
-- SMALLSERIAL    2BYTES                1  to 32627
-- SERIAL         4 BYTES
--BIGSERIAL       8 BYTES
create table tb_datatype1
  (
      datatype_id serial  primary key,
	  datatype_supported  boolean not null,
	  datatype_shortcut char(6),
	  datatype_name varchar(10),
	  decription  text
  )
-- add data to datatype table

insert into tb_datatype1( datatype_supported,datatype_shortcut, datatype_name,decription) 
values (TRUE,'bool','boolean','it value can be true or false');

insert into tb_datatype1( datatype_supported,datatype_shortcut, datatype_name,decription) 
values ('y','bool','boolean','it value can be true or false');

insert into tb_datatype1( datatype_supported,datatype_shortcut, datatype_name,decription) 
values ('1','bool','boolean','it value can be true or false');

insert into tb_datatype1( datatype_id, datatype_supported,datatype_shortcut, datatype_name,decription) 
values (DEFAULT,'1','bool','boolean','it value can be true or false');

insert into tb_datatype1( datatype_id, datatype_supported,datatype_shortcut, datatype_name,decription) 
values (8,'1','bool','boolean','it value can be true or false');

insert into tb_datatype1(datatype_supported,datatype_shortcut, datatype_name,decription) 
values ('1','bool','boolean','it value can be true or false');

--Getting sequence name : pg_get_serial_sequence('tablename','columnname')
select pg_get_serial_sequence('tb_datatype1','datatype_id')


--RESET VALUE FOR SERIAL : alter sequence sequence_name restart with newvaluetostart
alter sequence tb_datatype1_datatype_id_seq restart with 1000

insert into tb_datatype1
values (9,'1','bool','boolean','it value can be true or false');

-- check the data
select * from tb_datatype1;


-- create your custom sequence  create sequence sequencename start with integerno
create sequence my_sequence start with 200

-- use custom sequence as default value for the column with nextval(sequencename)
create table tb_myserialdemo
  (
     demo_id integer not null  default nextval('my_sequence'),
	 name varchar(10)

  )

  insert into tb_myserialdemo(name) values ('demo1');
  insert into tb_myserialdemo(name) values ('demo2') returning *;

  select pg_get_serial_sequence('tb_myserialdemo','demo_id')

  select * from tb_myserialdemo;