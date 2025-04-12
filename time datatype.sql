/*
    TIME 
	------------------------
	   stores the time of the day value  - 8 bytes 

	   columnname time(precision)

	   precision  :- number of fractional digits placed in second field  precision is upto 6 digits

	   formats :  HH:MM
	              HH:MM:SS
				  HHMMSS

				  HH:MM:SS.PPPPPP
				  MM:SS.pppppp
	              HHMMSS.pppppp

*/

--select now()
create table tb_delivery
   (
      delivery_id serial primary key ,
	  delivery_name varchar(200),
	  delivery_start_time time not null,
	  delivery_end_time time not null

   )

-- add records
insert into tb_delivery ( delivery_name, delivery_start_time, delivery_end_time) values
('goku','10:00:00','10:15:00'),
('vaggeta','10:05:00','10:30:25')

--view the records
select * from tb_delivery;

-- get current time
select current_time

-- use local time
select localtime;

-- get time with precision
select current_time(3)

select localtime , localtime(2)

select delivery_end_time -  delivery_start_time as time_taken_to_deliver from tb_delivery;

--using interval syntax  interval 'n type' 
-- n - number 
-- type -> second , minute , day , month , year,hour..

select current_time , current_time + interval '5 hours' as time_after_5_hrs;

select current_time , current_time + interval '2 days 2 hrs 30 minutes' as time_after_sometime

select current_date , current_date + interval '2 days 2 hrs 30 minutes' as time_after_sometime

-- extract()
select 
   delivery_name,
   extract(hour from delivery_start_time) as delivery_hour,
   extract(minute from delivery_start_time) as delivery_minute,
   extract(second from delivery_start_time) as delivery_second,
   extract(milliseconds from delivery_start_time) as delivery_milliseconds
   from tb_delivery

-- converting time to different time zone  [time with timezone] at time zone time_zone
select current_time, current_time at time zone 'utc-6' as converted_time_zone

