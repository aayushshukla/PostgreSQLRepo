/*

  tcl : 

     aayush          goku             vageta
	 1000             3500            2000 

	 commit
	 rollback
	 savepoint

*/
select * from product;
insert into product values (104,'d');

begin transaction
insert into product values (105,'e'),(106,'f'),(108,'g');
select * from product
-- commit
-- rollback
commit

begin 
insert into product values (110,'e');
select * from product
-- commit
-- rollback
commit



