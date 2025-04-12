/*
 DATE : 
   -----------------------
      STORES date type value

	  4 bytes to store date value

	  Default format :  YYYY-MM-DD   example 2025-04-11 

	  CURRENT_DATE  to get current date

	  now()          current date and time
	  select now()::date : date part only 

*/

create table tb_product
 (
    product_id serial primary key ,
	product_name varchar(200) not null,
	mfg_date date not null,
	exp_date date not null,
	delivery_date date not null default current_date
)

insert into tb_product(product_name,mfg_date,exp_date) values 
('atta biscuit','2025-03-10','2025-05-10')

select * from tb_product

select now() as current_Date_time

select now()::date as current_Date

select to_char(exp_date,'Mon dd yyyy') from tb_product

select exp_date - mfg_date as expir_After_months from tb_product
--EXTRACT() : to get year, quarter, week, month or day from date 
select 
  product_name,
  extract(YEAR from exp_date) as expiry_year,
  extract(MONTH from exp_date) as expiry_month,
  extract(DAY from exp_date) as expiry_day
  from tb_product;
-- age() with 1 argument: it will subtract the date value from current date 
select 
   product_name,
   age(exp_date) as expire_after_this_duration
   from tb_product
-- age() with 2 arguments  : it will subtract the second argument from the first argument

select 
   product_name,
   age(exp_date,'2024-01-31') as expire_after_this_duration
   from tb_product

 
  