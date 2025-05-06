create table accounts
 (
   account_id serial primary key,
   acc_name varchar(50) not null,
   acc_amount dec(15,2) not null
 
 )
 
 --adding data to the table
 insert into accounts(acc_name, acc_amount)
 values
 ('Umakant',30000),
 ('Yash',50000);

 select * from accounts;

 create or replace procedure pr_account_transfer(sacct int , racct int ,tamt dec) as
 $$
      begin
           if tamt >100  and tamt%100=0 then
		      
             update accounts set acc_amount = acc_amount -tamt  where account_id =sacct;

			 update accounts set acc_amount = acc_amount + tamt  where account_id =racct;

			 commit;
		  else
		     raise exception 'invalid amount ';
		  end if;

	  end;
$$ 
language plpgsql;
-- drop procedure [if exists] procedurename [cascade /restrict]
drop procedure pr_account_transfer;

call  pr_account_transfer(1,2,5000)

select * from accounts;

-- return  a value inout param mode
create or replace procedure pr_account_count(inout totalcount int default 0) as
$$
   begin
      select count(*) into totalcount from accounts;

   end;

$$ language plpgsql;

call pr_account_count()