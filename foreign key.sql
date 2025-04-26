/*

   create table tablename
     (
         col datatype  ,
		 col2 datatype ,
		 constraint foreignkeyconstraintname
		 references parenttable(parent_keycolumn),
		 [on delete deleteaction],[on update update_action]
		 actions : set null , set default , restrict , no action , cascade

		 Options:
		   On Delete : Action when parent row is deleted 
		       Cascade  : delete child rows
			   Set null : set FK in child as null 
			   Set default : set FK as default value
			   Restrict/ No Action : prevent delete
          On update : action when parent PK changes 
  )
    drop the dependency 

	  drop table table cascade

	  drop foreign key
	  alter table childtablename drop constraint constraint_fkey
*/

create table restaurants 
  (
     restaurants_id int primary key,
	 rname varchar(255) not null,
	 city varchar(255) not null,
	 address text,
	 cuisines varchar(200) not null,
 	 has_online_delivery boolean,
	 has_table_booking boolean,
	 votes integer,
	 rating numeric(4,2)
	 
  )

insert into  restaurants values 
(1,'Azzure','Bangalore','hsr','italian',TRUE,TRUE,200,4.6),
(2,'Trffles','Bangalore','Koramanagla','american',TRUE,TRUE,500,4.8),
(3,'Big brewsky','Bangalore','hsr','italian',TRUE,TRUE,200,4.6)

select * from restaurants;
select * from users;


create table orders
 (
   order_id int,
   user_id int,
   restaurants_id  int,
   order_date date,
   order_status varchar,
   delivery_date date default current_Date,
   total_price numeric(10,2),
   constraint fk_restaurant
   foreign key(restaurants_id)
   references restaurants(restaurants_id)
   
 )

 select * from orders;

 insert into orders values (101, 1,2,'2025-04-10','completed','2025-04-10',1000)

 insert into orders values (102, 1,5,'2025-04-10','completed','2025-04-10',1000) -- failed 

 -- Add a forign key constraint in an existing table


/*

   alter table childtablenanme  add constraint constriantname foreign key(column) references parent table (parent column name) on delete cascade


*/

select * from users;

alter table orders add constraint users_fk foreign key(user_id) 
references  users (user_id)














 