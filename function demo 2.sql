select * from orders;

create or replace function fn_orders_ship_by_names(pattern varchar) returns table 
(
  oid smallint,
  cid character,
  empid orders.employee_id%type
)
as
$$
   begin
      return query
	     select 
		    order_id,
			customer_id,
			employee_id
			from orders 
			where ship_name like pattern;
			exception 
			   when NO_DATA_FOUND then
			      raise exception 'No data found for given pattern = %',pattern

   end;

$$ language plpgsql;

select fn_orders_ship_by_names('Vins%')

select (fn_orders_ship_by_names('Vins%')).*


----------------------------------

do
$$
   declare 
       rec record;
	   orderid smallint =1;

	 begin
         
		     select customer_id,order_date from orders into strict rec where order_id=orderid;
			 exception 
			   when NO_DATA_FOUND then
			      raise exception 'No data found for given order id = %',orderid;

	 end;


$$ language plpgsql


do
$$
   declare 
       rec record;
	   orderid smallint =1;

	 begin
         
		     select customer_id,order_date from orders into strict rec where customer_id like 'V%' ;
			 exception 
			   when too_many_rows then
			      raise exception 'expecting one row but yourresult set have many rows';

	 end;


$$ language plpgsql


do
$$
   declare 
       rec record;
	   orderid smallint =1;

	 begin
         
		     select customer_id,order_date from orders into strict rec where customer_id like 'V%' ;
			 exception 
			   when sqlstate 'POOO3' then
			      raise exception 'expecting one row but yourresult set have many rows';

	 end;


$$ language plpgsql


CREATE  OR REPLACE FUNCTION  fn_div_exception ( real , real ) returns real as
$$
    declare
	  res real;
	 begin 
             res := $1/$2;
			 return res;
             exception 
			   when division_by_zero then 
			      raise info 'Divide by zero';
				  raise info 'Error information  % %',SQLSTATE,SQLERRM;
				  REtURN 0;
	 end;
$$ LANGUAGE PLPGSQL

SELECT fn_div_exception (10,0)
select * from order_details where unit_price>14

CREATE  OR REPLACE FUNCTION  fn_unit_price_gt () returns order_details as
$$
    declare
	  res record;
	 begin 
	      
            select * from order_details into res where unit_price>14 ;
			return res;
	 end;
$$ LANGUAGE PLPGSQL

select fn_unit_price_gt ()

/*
    foreach var in array arrayname
	loop
         statement 

	end loop;

	for 
	loop

          body of loop
	end loop;

	while condition
	loop
         body of loop
	end loop;

*/


CREATE  OR REPLACE FUNCTION  fn_unit_price_gt1 () returns setof order_details as
$$
    declare
	  res record;
	 begin 
	  for res in    -- start for each loop  for var in collection/array
            select * from order_details where unit_price>14 
	  loop  -- loop body starts
         return next res; -- body of loop
	  end loop;  -- loop body ends
			return;
	 end;
$$ LANGUAGE PLPGSQL

select (fn_unit_price_gt1 ()).*

