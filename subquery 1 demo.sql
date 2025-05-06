/*

   i) subqueries must be enclosed within parentheses.
   
   SYNTAX
     select columnnames from tablename 
	   where (
	          select columnames from tablename
	         )

   ii)An ORDER BY can not be used within a subquery although the main query can use an ORDER BY
   iii) The GROUP BY can be used to perform same function as the ORDER BY in a subquery
   iv) Subqueries that return more than one rows can only be used with  multivalue operators
       such as IN,EXISTS ,NOT IN , ANY , ALL operator

	   Non correlated  subqueries  : - sub query can be run independently of outer query

	   correlate subqueries  : depends on the value from outer query , run once for rach row of outer query

 based on result type
	   scaler : return single  value
	   row subquery :  return a single row with multi values 
	   table subquery : return multi row with optionally multi column  often used with IN , EXISTS  or as drevied table (in from )
	   
always start writing subquery first 


   
    correlated subqueries are used for row by row processing 
	each subquery excecute once for every row of the outerquery
    correlated subquery is evaluted once for each row process by the outer query statement 
	
	----nested subqueries vs correlated -----
	nested subquery the inner SELECT query runa first and executed once returning values to used
	by main query
	
	A correlated subquery executes once for each candidate row considered by outer query.
	Inner query is driven by outer query
	
	PostgreSQL evaluates from inside to outside
 
 

*/

select * from order_details;

select * from employees;

select * from products;



-- get first name , lastname of all the employee who are younger then fuller
select first_name, last_name , birth_date from employees where birth_date > (
  select birth_date from employees where last_name='Fuller'
)

select * from customers;
select * from orders;

-- show customer record who are not shipping to brazil ,uk and mexico
select * from customers where customer_id in(
  select customer_id from orders where ship_country not in ('Brazil','Mexico','UK'))

-- 
select * from employee_territories;

-- show all employees firstname , lastname , country  where terriotory 60179
select first_name, last_name,country from employees where employee_id in 
  (
    select employee_id from employee_territories where territory_id::integer <60179
	)

select p1.product_name,
       p1.unit_price,
	   p1.units_on_order,
	   p1.category_id
	   from products as p1
	   where p1.units_on_order >
	     (
             select min(units_on_order) from products p2  where p1.unit_price = p2.unit_price
		 )
select * from products;

create table product_copy (pid int primary key , pname varchar not null , price int not null);

insert into product_copy values (1,'mobile',10000),(2,'laptop',50000)

select * FROM product_copy;

create table product1_copy (pid int primary key , pname varchar not null , price int not null);

--nsert into product1_copy values (1,'mobile',10000),(3,'tab',50000)

insert into product1_copy select * from product_copy  where pid in (select pid from product_copy where pid in (1,3,4,5) )

select * FROM product1_copy;

update product_copy set price =20000 where pid = (select pid from product_copy where pname ='mobile')