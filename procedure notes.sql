/*

     Procedures vs functions
	 ----------------------------------------------
	 
	 1)user defined functions can not execute Transctions.Inside a function we can not start transction 
	 
	 Procedures supports transctions
	 
	 2) Procedures does not return value .How ever we can return statement without expression to stop the procedure
	 
	 INOUT can be used to return a value from stored procedures
	 
	 3) can not be called from SELECT
	 
	 CALL procedurename()
	 
	 4) they are compiled object 
	 
	 5)procedures may or may not have parameters.
	 
	 6) Procedure with out arguments is knows as STATIC
	 
	 7) Stored procedure that use parameter values are called dynamic 
	 


--parameters are optional
create or replace procedure procedureName(param1 type,param2 type) -- in , out ,inout 
as
$$
 
  declare
    -- declare can be empty 
  begin
  
  
  end;


$$
language plpgsql;

call procedureName(p1,p2) */