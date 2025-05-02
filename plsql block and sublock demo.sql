/*
   PL/ pgSQL  block structure
do $$
   [<<label>>]
   [DECARE]  -- it is option
     declaration 
	 Begin
	    body
	 end;[label]

	 block end with ; after end keyword

$$

*/
DO
 $$ -- no label
   Declare -- blcok declaration
      -- varaiblename datatype := or =  value
	  emp_id integer = 2801788;
      first_name varchar(200) := 'Aayush';
	  last_name  varchar(100) := 'Shukla';
	  batch_end_date date :='2025-05-07';
	Begin
	   raise notice   'Batch details employee id = % employeename  = %  % batch end date = %', emp_id,first_name,last_name, batch_end_date;

    end;

 $$

DO
 $$
   <<Parentblock>>
   Declare 
     counter integer  :=0;
	Begin  -- body of parent block
	    counter := counter+5;
		raise notice 'value of counter in parent is = %',counter;

		-- subblock
		 declare 
		    counter integer :=0;
			begin  -- body of subblock
			   counter := counter +2;
			   raise notice 'value of counter in sub block  is = %',counter;
			    raise notice 'value of parent counter in sub block  is = %',Parentblock.counter; -- to get value of parent in child or subblock 
				-- blockname.variablename

            end; -- end sublock
   end;  -- end parent block
 $$