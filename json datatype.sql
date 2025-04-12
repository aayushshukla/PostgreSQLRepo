-- JSON 
-- write query to update json value task 
create table tb_jsondemo
  (
        d_id serial primary key,
		post json 
  )

select  * from tb_jsondemo

insert into tb_jsondemo(post) values
('[1,2,3,4,5]'),
('[10,11,12]'),
('{
   "userId": "1",
    "id": "8",
    "title": "dolorem dolore est ipsam",
    "body": "dignissimos"
}') returning *;

select post from tb_jsondemo;
-- the -> operator exttract JSON object by a key .It will surrounded with double quotes
select d_id,post ->'title' as post_title from tb_jsondemo

-- ->> to extract json object field by key as text

select d_id,post ->'title',post ->>'title' as post_title from tb_jsondemo

select post->>'userId' from tb_jsondemo where post->>'id'='8'