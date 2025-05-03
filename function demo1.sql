/*

    create [or replace] function functioname(params) returns returntype 
	language sql / plpgsql
	as
	   $$
            declare

			begin 


			end;


	   $$
 ** param are option
	   1) positional notation  select function(param)
	   2) named notation  :  select functioname
	     (
               param2 => 1
			   param1 =>2
		 )
		3) mixed notation  
		    select functionname (param1 , param3=>value , param=>5)
			can not use named notation before positional notation
	   
*/

-- function without return
select * from employees;
--sql function
create or replace function fn_employees_update_city() returns  void as 
$$
   update employees set city ='NA' where country is NULL

$$
language sql

-- call function
select fn_employees_update_city()

select * from order_details;
-- get the max price of product
create or replace function fn_orders_details_max_price() returns order_details.unit_price%type as
$$
   select max(unit_price) from order_details
$$
language sql

select fn_orders_details_max_price()

-- get the biggest order details  = unit_price* quantity
create or replace function fn_orders_details_max_price() returns real as
$$
    select max(total_amount) from 
	(
	    select order_id, sum(unit_price*quantity) as total_amount 
		from order_details group by order_id
	)

$$
language sql

select fn_orders_details_max_price()


--- plpgsql
create or replace function fn_get_orders_details_max_price() returns real as
$$
  begin
  return  max(total_amount) from 
	(
	    select order_id, sum(unit_price*quantity) as total_amount 
		from order_details group by order_id
	);
  end;

$$
language plpgsql

select fn_get_orders_details_max_price()

-- calculate average unit price
create or replace function fn_get_order_details_avg_price() returns real as
$$
   declare 
      avg_price real;
   begin
           select avg(unit_price) into avg_price from order_details;
		   return avg_price;
   end;
   

$$
language plpgsql

select fn_get_order_details_avg_price()
-- declare variable in fuction
create or replace function fn_add_func(integer,integer ) returns integer as
$$
    declare
	   res integer;
	 begin
	      raise notice ' value 1  = %  , value 2 = %',$1,$2;
          res := $1 + $2 ;
          return res;
	 end;


$$
language plpgsql;

select fn_add_func(10,20)

create or replace function fn_add1_func(integer,integer ) returns integer as
$$
    declare
	   res integer;
	   x alias for $1;
	   y alias for $2;
	 begin
	      raise notice ' value 1  = %  , value 2 = %',$1,$2;
          res := x + y ;
          return res;
	 end;


$$
language plpgsql;

select fn_add1_func(100,200)
language plpgsql;

--Using IN ,OUT  without returns

-- we ue returns clause inthe function declaration , however we can use in , out , inout without returns
-- param modes
/*
   IN         in variablename type   -- input param
   OUT        out  varaiblename type   -- output param 
   INOUT      inout  variablename type 

*/

create or replace function fn_cal_total_bill(in no_of_item integer , in price integer , in gst integer , out total_bill real)
as
$$
   begin
       total_bill := (no_of_item*price) + ((no_of_item*price) *gst /100);   
   end;

$$
language plpgsql;

select fn_cal_total_bill(5,10,18)

-- can we output more than one value

create or replace function fn_cal_total_bill1(in no_of_item integer , in price integer , inout gst integer , out total_bill real)
as
$$
   begin
       total_bill := (no_of_item*price) + ((no_of_item*price) *gst /100);
	   gst = gst;
	   

   end;

$$
language plpgsql;

select fn_cal_total_bill1(5,10,18)

/*
   if expression then  statement1
   elsif expression then statemnet3
   else  statement2
   end if


*/

create or replace function fn_cal_total_bill2(in no_of_item integer , in price integer , inout gst integer , out total_bill real)
as
$$
   begin
       if gst <=0 then 
	         total_bill := 0;
	   elsif gst >=10 then
              total_bill := (no_of_item*price) + ((no_of_item*price) *gst /100);
	   else  
	        total_bill := (no_of_item*price);
	   end if;
	 
	 end;

$$
language plpgsql;

select fn_cal_total_bill2(5,10,18)

select fn_cal_total_bill2(5,10,5)

select fn_cal_total_bill2(5,10,-5)


create or replace function fn_get_order_size(real, real) returns text as
$$
   declare
      up alias for $1;
	  quant alias for $2;
  
   begin
          if  up*quant >100 then 
		     return 'big order';
		  elsif  up*quant <50 and up*quant>20 then
		      return 'medium order';

		  else
		      return 'small order';
		  end if;
		    
   end;

$$
language plpgsql

select * from order_details;

select fn_get_order_size(unit_price,quantity) from order_details;

/*
    case search-expression
	   when expression then statemen1
	   when expression2  then statement2
	   else 
	     statement
	 end case;


*/

create or replace function fn_cal_total_bill4(in no_of_item integer , in price integer , inout gst integer , out total_bill real)
as
$$
   begin
       case gst
       		when  0 then 
	        	 total_bill := 0;
	   		when 18 then
              	total_bill := (no_of_item*price) + ((no_of_item*price) *gst /100);
	   		else  
	        	total_bill := (no_of_item*price);
	    end case;
	 
	 end;

$$
language plpgsql;

select fn_cal_total_bill4(5,10,0)

select fn_cal_total_bill4(5,10,18)

select fn_cal_total_bill4(5,10,10)

select * from orders;


create or replace function fn_order_ship_via(shipvia orders.ship_via%type) returns text as
$$
    begin
     case shipvia
	   when 1 then 
	      return 'Speedy';
		when 2 then 
		    return 'United';
		when 3 then 
		    return 'Federal';
		else 
		   return 'No Info';
		end case;
	end;
$$
language plpgsql;

select fn_order_ship_via(ship_via) from orders;


create or replace function fn_latest_order() returns orders  as 
$$
  select * from orders order by order_date desc nulls last,order_id desc limit 1

$$
language sql

select fn_latest_order()

--select (functionanme()).*

select (fn_latest_order()).*

-- select (fn_latest_order()).columnname
select (fn_latest_order()).customer_id

--select columnname(functionname())
select customer_id(fn_latest_order())


-- return multiple rows

create or replace function fn_latest_order1() returns setof orders  as 
$$
  select * from orders order by order_date desc nulls last,order_id desc limit 10

$$
language sql

select fn_latest_order1

select (fn_latest_order1()).*

















