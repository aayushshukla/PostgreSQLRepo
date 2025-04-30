-- show all active/abondon processes
select * from pg_stat_activity

select state,datname,pid from pg_stat_activity

-- get pid 
select  pg_backend_pid() as process_id

--show idle process
select state,datname,pid,*
from pg_stat_activity
where datname ='hrdb'  -- name of database 
and  pid <> pg_backend_pid() -- dont kill my own connection
and state='idle'             -- the value of state column


--kill pid
select pg_terminate_backend(pid)
from pg_stat_activity
where datname ='hrdb'  -- name of database 
and  pid <> pg_backend_pid() -- dont kill my own connection
and state='idle'  -- state is idle 
and pid =17100                   -- use pid column value

select  * from product;

begin 
 update product set pname='parle' where pid=106
commit

select pg_terminate_backend(pid)
from pg_stat_activity
where datname ='hrdb'  -- name of database 
and  pid <> pg_backend_pid() -- dont kill my own connection
and state='idle'  -- state is idle 
and pid =27596
--22364
begin 
 update product set pname='parle' where pid=106
commit



