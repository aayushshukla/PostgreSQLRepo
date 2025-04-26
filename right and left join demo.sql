insert into product values (101,'a'),(102,'b'),(103,'c')
select * from product;
insert into inventory values (1001,101,3000),(1002,105,4000)
select * from inventory;

select p.pid , p.pname ,iv.invid, iv.price
from product as p
left join inventory as iv
on p.pid = iv.pid


select p.pid , p.pname ,iv.invid, iv.price
from product as p
right join inventory as iv
on p.pid = iv.pid