select id , avg(rdata) , count(*) from tb_random group by id

create materialized view mv_random_view as
select id , avg(rdata) , count(*) from tb_random group by id

select * from mv_random_view

delete from tb_random where id =103

select * from tb_random

select * from mv_random_view -- it will show old view as it will not refreshed 

-- to check updated records  need to refresh the materialized view
refresh materialized view  mv_random_view

-- again check records after refresh
select * from mv_random_view
