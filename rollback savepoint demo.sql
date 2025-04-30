/*
   t
     ----
	 ----
	 sp1

	 ---
	 ---
	

	 ---
	 ---
	 sp3

	 release sp2
	 rollback to savepoint sp1


*/



select * from product
begin transaction 
insert into product values (113,'x');
select * from product
commit

insert into product values (111,'h');

begin transaction
insert into product values (114,'r'),(115,'s'),(116,'t');
select * from product
rollback

-- savepoint nameofsavepoint
-- rollback to savepoint savepointname
-- release savepoint savepointname

begin transaction 
--commit

insert into product values (114,'r'),(115,'s'),(116,'t')
savepoint sp1;

insert into product values (117,'r1'),(118,'s1'),(119,'t1')
savepoint sp2

insert into product values (120,'r2'),(121,'s2'),(122,'t2')
delete from product where pid =122
savepoint sp4

insert into product values (123,'r5')
savepoint sp3

select * from product
--rollback to savepoint sp2
--rollback to savepoint sp1

release  savepoint sp4
rollback to savepoint sp4

end transaction






