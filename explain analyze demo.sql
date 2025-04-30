-- explain analyze
/*
   it prints out the best plan to execute the query
   it runs the query
   report back some stats information
*/

-- explain 
explain select * from order_details where quantity =5

select * from order_details where quantity =5 

--.156 -.100 =.56  -- actaul time query(executiontime - planning time)
--.156 + .100  = total time


/*
   "Bitmap Heap Scan on order_details  (cost=4.52..17.36 rows=67 width=14)"
"  Recheck Cond: (quantity = 5)"
"  ->  Bitmap Index Scan on idx_order_details_quantity  (cost=0.00..4.50 rows=67 width=0)"
"        Index Cond: (quantity = 5)"

*/

-- explain analyze 
explain analyze select * from order_details where quantity =5