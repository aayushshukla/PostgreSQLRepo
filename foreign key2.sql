drop table if exists orders;
drop table if exists restaurants ;


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
   on delete set null
   on update CASCADE
   
   
 )

 select * from orders;
 select * from restaurants;

 insert into orders values (102, 1,1,'2025-04-10','completed','2025-04-10',2000)

 update  restaurants set restaurants_id=5,rname='Truffles' where restaurants_id=2 

 delete from restaurants where restaurants_id=5;