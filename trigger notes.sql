/*

     1. A trigger is defined as any event that sets course of action into motion
	 2. A postgreSQL trigger is a function invoked automatically whenever an
	    event associated with trigger occurs
	 3. An event could be any of the give  insert , update , delete or truncate.
	 4. A trigger can be associated with a specified table, view or foreign table 
	 5. We can create trigger 
	    
		Before - if trigger is invoked before an event .It can skip operation of current
		row or even change on table .
		
		After - all changes are available on the trigger
		
		Instead of event/operation 
		
	6. If multiple triggers on a table they will be fired on alphabetical orders. 
	   Before triggers fired first
	   Perform row operation that the trigger has be fired for and 
	   than executes after trigger
	   
	   
	7.Trigger can modify data before or after the actual modification done
	8.Difference from procedures 
	   triggers can not be manually executed 
	   can not receive parameters


     Types Of Triggers:
	   
	   Row level triggers- executes for each row that is modified by event    -update -20 row modified -- row level trigger will be executed 20 timer
	   Statement level triggers - execute once per statement
	   
	   
	   Key Points
	   i) no triggers on select statement because select statement does not modify any row
	      	use Views in such cases
			
			
	   ii)user defined functions are allowed in triggers
	   iii) a single trigger can support multiple actions


*/