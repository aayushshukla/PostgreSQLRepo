--Upsert It is combination of update or insert 
/*

    When we add a new row into the table , PostgreSQL will update the row if it is already present (Update operation).
	If row is not exists then it will add new row (insert operation)

	Syntax :  insert into tablename (columname1,columname2...coln) values (v1,v2,v3...vn) on conflict ACTION (columnname)

	Action can be:  
	       DO NOTHING                     do nothing if row is already present 
		   DO Update set column= value    update the fields if row is already present 
   	
*/

select * from coupons;

insert into coupons values (102,'infytest1',2.5,false,'2025-04-10',3.0) on conflict (coupon_id) DO NOTHING

-- Insert record , on conflict and set new values

insert into coupons values (102,'infytest1',2.5,false,'2025-04-10',3.0) on conflict (coupon_id) do update set code ='infytest1',is_active=true